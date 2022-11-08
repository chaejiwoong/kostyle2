package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.AuctionVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.OrderCancelVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.ProductImgVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.StockVO;
import ko.kostyle.domain.WinningBidVO;
import ko.kostyle.dto.AddressDTO;
import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.AdminProductDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ImgDTO;
import ko.kostyle.dto.OrderCancelDTO;
import ko.kostyle.dto.OrderDTO;
import ko.kostyle.dto.OrderDetailDTO;
import ko.kostyle.dto.OrderPayDTO;
import ko.kostyle.dto.OrderRequestDTO;
import ko.kostyle.dto.WinningBidDTO;
import ko.kostyle.dto.members.MemberDTO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.mapper.OrderCancelMapper;
import ko.kostyle.mapper.OrderMapper;
import ko.kostyle.mapper.ProductImgMapper;
import ko.kostyle.mapper.ProductMapper;
import ko.kostyle.mapper.StockMapper;
import ko.kostyle.mapper.WinningBidMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
@Transactional(readOnly = true)
public class OrderServiceImpl implements OrderService{
	
	private final OrderMapper orderMapper;
	private final ProductImgMapper imgMapper;
	private final WinningBidMapper winningBidMapper;
	private final AuctionMapper auctionMapper;
	private final OrderCancelMapper orderCancelMapper;
	private final MemberMapper memberMapper;
	private final StockMapper stockMapper;
	private final ProductMapper productMapper;
	
	// 회원의 주문리스트 가져오기
	@Override
	public List<OrderDTO> orderList(Criteria cri) {
        List<OrderVO> orders = orderMapper.orderList(cri,cri.getFilter(), SecurityUtil.getCurrentMemberId());
        List<OrderDTO> dtos = new ArrayList<>();
        for (OrderVO order : orders) {
            // 주문에 해당하는 배송지
            AddressDTO address = AddressDTO.of(orderMapper.addressDetail(order.getAno()));
            OrderDTO dto = OrderDTO.builder()
                    .ono(order.getOno())
                    .address(address)
                    .payment(order.getPayment())
                    .totalPrice(order.getTotalPrice())
                    .status(order.getStatus())
                    .created_date(order.getCreated_date())
                    .category(order.getCategory().equals("product")?"구매":"낙찰")
                    .build();
            
            // 주문목록마다 대표상품 출력
            if(order.getCategory().equals("product")) {
            	dto.setOrderDetail(firstOrderDetail(order.getOno()));
            	
            	int count = orderMapper.orderDetails(order.getOno()).size();
            	String name = dto.getOrderDetail().getProduct().getName();
            	
            	if(count == 1) {
            		dto.setName(name);
            	}else {
            		dto.setName(name +" 외 " + (count-1) + "개");
            	}
            	
            }else {
            	dto.setWinningBid(getWinningBid(order.getOno()));
            	dto.setName(dto.getWinningBid().getName());
            }

            
            dtos.add(dto);
        }

        return dtos;
	}

	// 주문의 대표 주문상세 조회
	@Override
	public OrderDetailDTO firstOrderDetail(Long ono) {
		
		return toDto(orderMapper.firstOrderDetail(ono));
	}
	
	// 하나의 주문상세 조회
	@Override
	public OrderDetailDTO orderDetail(Long odno) {
		// TODO Auto-generated method stub
		return toDto(orderMapper.orderDetail(odno));
	}

	// 해당 주문의 주문상세 리스트
	@Override
	public List<OrderDetailDTO> orderDetails(Long ono) {
        return orderMapper.orderDetails(ono).stream()
        		.map(vo -> toDto(vo))
        		.collect(Collectors.toList());
	}
	
	// 낙찰된 상품의 상세 가져오기
	@Override
	public WinningBidDTO getWinningBid(Long ono) {
		
		WinningBidVO winningBid = winningBidMapper.winningBidDetail(ono);
		AuctionVO auction = auctionMapper.auctionDetailByBno(winningBid.getBno());
		
		ImgDTO img = ImgDTO.of(auctionMapper.auctionImgDetail(auction.getApno()).get(0));

		return WinningBidDTO.builder()
				.wbno(winningBid.getWbno())
				.name(auction.getName())
				.price(auction.getBest_bid_price())
				.img(img)
				.build();
		
	}
	
	private OrderDetailDTO toDto(OrderDetailVO orderDetail) {
    	// 주문상세에 출력할 상품 조회
    	ProductVO product = orderMapper.productDetail(orderDetail.getOdno());
    	AdminProductDTO productDto = AdminProductDTO.builder()
    									.pno(product.getPno())
    									.name(product.getName())
    									.build();
    	
    	// 해당 상품의 이미지 조회 후 DTO로 변환
    	ProductImgVO img = imgMapper.selectImg(product.getPno());
    	ImgDTO imgDto = null;
    	if(img != null) {
			imgDto = ImgDTO.builder()
					.filename(img.getFilename())
					.filepath(img.getFilepath())
					.uuid(img.getUuid()).build();
    	}
    	
    	productDto.setImg(imgDto);
    	
    	
    	// 주문상세 DTO 생성
    	return OrderDetailDTO.builder()
    			.odno(orderDetail.getOdno())
    			.ono(orderDetail.getOdno())
    			.product(productDto)
    			.amount(orderDetail.getAmount())
    			.price(orderDetail.getPrice())
    			.p_size(orderDetail.getP_size())
    			.build();
		
	}
	
	
	//주문 취소
	

	@Override
	public int getTotal(Criteria cri) {
		// TODO Auto-generated method stub
		return orderMapper.getTotal(cri);
	}

	@Override
	@Transactional
	public void orderCancel(OrderCancelDTO dto) {
		OrderCancelVO vo =OrderCancelVO.builder()
				.category(dto.getCategory())
				.reason(dto.getReason())
				.odno(dto.getOdno())
				.build();


		// 주문 취소 추가
		orderCancelMapper.insertOrderCancel(vo);

		// 해당 취소주문상세 불러오기
		OrderDetailVO orderDetail = orderMapper.orderDetail(vo.getOdno());
		// 주문 가격 업데이트
		orderCancelMapper.updateOrderPrice(orderDetail.getPrice(), orderDetail.getOno());

		OrderVO order = orderMapper.getOrder(orderDetail.getOno());
		
		
		// 주문취소된 결재금액을 포인트로 반환
		memberMapper.updatePoint(order.getMno(), orderDetail.getPrice());
		
		
		// 재고 되돌리기
		StockVO stock = StockVO.builder()
				.pno(orderDetail.getPno())
				.amount(orderDetail.getAmount())
				.p_size(orderDetail.getP_size())
				.build();
		
		stockMapper.updateStock(stock);
		
	}

	// 주문결제창에 출력할 상품상세 리스트
	@Override
	public List<OrderDetailDTO> OrderPayList(OrderPayDTO orderPay) {
		
		List<OrderDetailDTO> dtos = new ArrayList<OrderDetailDTO>();
		
		// 주문 상세에서 넘어온 경우
		if(orderPay.getPayList().size() == 0) {
			dtos.add(ofDetail(orderPay));
			return dtos;
		// 장바구니에서 넘어온 경우
		}else {
			return orderPay.getPayList().stream().map(pay -> ofDetail(pay)).collect(Collectors.toList());
		}
		
	}
	
	// OrderDetailDTO 변환 로직
	private OrderDetailDTO ofDetail(OrderPayDTO dto) {
    	// 주문상세에 출력할 상품 조회
    	ProductVO product = productMapper.productGet(dto.getPno());
    	AdminProductDTO productDto = AdminProductDTO.builder()
    									.pno(product.getPno())
    									.name(product.getName())
    									.build();
    	
    	// 해당 상품의 이미지 조회 후 DTO로 변환
    	ProductImgVO img = imgMapper.selectImg(product.getPno());
    	ImgDTO imgDto = null;
    	if(img != null) {
			imgDto = ImgDTO.builder()
					.filename(img.getFilename())
					.filepath(img.getFilepath())
					.uuid(img.getUuid()).build();
    	}
    	
    	productDto.setImg(imgDto);
		
		return  OrderDetailDTO.builder()
			.p_size(dto.getP_size())
			.price(dto.getPrice())
			.amount(dto.getAmount())
			.product(productDto)
			.build();
		
	}


	// 주문결제
	@Override
	@Transactional
	public void orderPayService(OrderRequestDTO dto) throws Exception {
		Long mno =SecurityUtil.getCurrentMemberId();
		
		MemberVO member = memberMapper.memberDetailById(mno);
		// 총합 구하기
		List<OrderDetailDTO> list = dto.getOrderDetails();
		
		int totalPrice = list.stream()
				.mapToInt(OrderDetailDTO::getPrice).sum();
		
		
		if(dto.getPay().equals("point")) {			
			// 포인트 검증
			if(member.getPoint() < totalPrice) {
				throw new RuntimeException("포인트 잔액이 부족합니다.");
			}
			
			log.info("totalPrice : " + totalPrice);		
			// 총 금액 - 적립포인트만큼 포인트 차감
			memberMapper.updatePoint(mno, totalPrice-dto.getAccumulate()); 
		}else {
			// 포인트 검증
			if(member.getPoint() < dto.getPoint()) {
				throw new RuntimeException("포인트 잔액이 부족합니다.");
			}

			// 사용포인트만큼 포인트 차감
			memberMapper.updatePoint(mno, dto.getPoint()); 
		}
		
		OrderVO order = OrderVO.builder()
				.ano(dto.getAno())
				.mno(SecurityUtil.getCurrentMemberId())
				.payment(dto.getPay())
				.totalPrice(totalPrice)
				.status("상품준비중")
				.category("product")
				.build();
		
		
		//주문 추가
		orderMapper.insertOrder(order);
		
		for(OrderDetailDTO orderDetail : list) {
			orderDetail.setOno(order.getOno());		
			// 주문 상세 추가
			StockVO stock = StockVO.builder()
				.pno(orderDetail.getPno())
				.p_size(orderDetail.getP_size())
				.build();
				
			int amount = stockMapper.stockAmount(stock);
			
			// 재고 검증
			if(amount < orderDetail.getAmount()) {
				throw new RuntimeException("해당 상품의 재고가 소진되었습니다.");
			}
			
			orderMapper.insertOrderDetail(OrderDetailDTO.toVO(orderDetail));
		}
		
	}

}
