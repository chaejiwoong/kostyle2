package ko.kostyle.service;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.AuctionVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.WinningBidVO;
import ko.kostyle.dto.AddressDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.AdminProductDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.WinningBidDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.members.MemberDTO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.BidMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.mapper.WinningBidMapper;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j
@Transactional(readOnly = true)
public class AdminOrderServiceImpl implements AdminOrderService {

    private final AdminOrderMapper orderMapper;
    private final MemberMapper memberMapper;
    private final AuctionMapper auctionMapper;
    private final WinningBidMapper winningBidMapper;

    //관리자 주문정보 가져오기
    @Override
    public List<AdminOrderDTO> orderList(Criteria cri) {
        List<OrderVO> orders = orderMapper.orderList(cri);
        List<AdminOrderDTO> dtos = new ArrayList<>();
        for (OrderVO order : orders) {
            MemberVO vo = memberMapper.memberDetailById(order.getMno());
            AdminOrderDTO dto = AdminOrderDTO.builder()
                    .ono(order.getOno())
                    .member(MemberDTO.of(vo))
                    .payment(order.getPayment())
                    .totalPrice(order.getTotalPrice())
                    .status(order.getStatus())
                    .created_date(order.getCreated_date())
                    .category(order.getCategory())
                    .build();

            dtos.add(dto);
        }

        return dtos;
    }

    // 하나의 주문 조회
    @Override
    public AdminOrderDTO orderDetail(Long ono) {
        OrderVO order = orderMapper.getOrder(ono);
        MemberVO member = memberMapper.memberDetailById(order.getMno());
        AddressVO address = orderMapper.addressDetail(order.getAno());

        AddressDTO addressDTO = AddressDTO.builder()
                .ano(address.getAno())
                .address(address.getAddress())
                .tel(address.getTel())
                .name(address.getName())
                .is_default(address.is_default())
                .build();


        AdminOrderDTO dto = AdminOrderDTO.builder()
                .ono(order.getOno())
                .address(addressDTO)
                .member(MemberDTO.of(member))
                .payment(order.getPayment())
                .totalPrice(order.getTotalPrice())
                .status(order.getStatus())
                .created_date(order.getCreated_date())
                .category(order.getCategory())
                .build();

        return dto;
    }

    // 주문 상세 가져오기
    @Override
    public List<AdminOrderDetailDTO> orderDetails(Long ono) {
        List<OrderDetailVO> list = orderMapper.orderDetails(ono);
        log.info("----------------------------------------");
        
        log.info("orderDetails : " + list);
        List<AdminOrderDetailDTO> dtos = new ArrayList<AdminOrderDetailDTO>();
        
        for(OrderDetailVO orderDetail : list) {
        	AdminOrderDetailDTO dto = new AdminOrderDetailDTO();
        	
        	ProductVO product = orderMapper.productDetail(orderDetail.getOdno());
        	AdminProductDTO productDto = AdminProductDTO.builder()
        									.pno(product.getPno())
        									.name(product.getName())
        									.build();
        	
        	dto.setOdno(orderDetail.getOdno());
        	dto.setOno(ono);
        	dto.setProduct(productDto);
        	dto.setAmount(orderDetail.getAmount());
        	dto.setPrice(orderDetail.getPrice());
        	dto.setP_size(orderDetail.getP_size());
        	
        	dtos.add(dto);
        }
        
        return dtos; 
    }


	@Override
	public int getTotal(Criteria cri) {
		return orderMapper.getTotal(cri);
	}

	// 낙찰된 상품의 상세 가져오기
	@Override
	public WinningBidDTO getWinningBid(Long ono) {
		
		WinningBidVO winningBid = winningBidMapper.winningBidDetail(ono);
		
		AuctionVO auction = auctionMapper.auctionDetailByBno(winningBid.getBno());

		return WinningBidDTO.builder()
				.wbno(winningBid.getWbno())
				.name(auction.getName())
				.price(auction.getBest_bid_price())
				.build();
		
	}

}
