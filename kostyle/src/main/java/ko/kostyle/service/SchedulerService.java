package ko.kostyle.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.AuctionVO;
import ko.kostyle.domain.BidVO;
import ko.kostyle.domain.DeliveryVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.WinningBidVO;
import ko.kostyle.mapper.AddressMapper;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.BidMapper;
import ko.kostyle.mapper.DeliveryMapper;
import ko.kostyle.mapper.WinningBidMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
@RequiredArgsConstructor
public class SchedulerService {
	
	private final AdminOrderMapper orderMapper;
	private final DeliveryMapper deliveryMapper;
	
	private final BidMapper bidMapper;
	private final WinningBidMapper winningBidMapper;
	private final AuctionMapper auctionMapper;
	private final AddressMapper addressMapper;
	
	// 배송도착시간이 지난 상품들에 대해서 자동으로 배송완료 업데이트 쿼리
	@Scheduled(cron = "0 0 0/1 * * *")
	@Transactional
	public void updateOrderStatus() {
		
		log.info("크론 배송 스케줄러 실행....");
		try {
			List<DeliveryVO> list = deliveryMapper.getDeliveryList();
			for(DeliveryVO vo : list) {
				Date now = new Date();
				if(now.getTime() > vo.getStart_date().getTime()) {
					OrderVO order = new OrderVO();
					
					order.setOno(vo.getOno());
					order.setStatus("배송완료");
					
					orderMapper.updateOrderStatus(order);
		
				}
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	// 주문상세가 모두 취소된 주문 삭제
	@Scheduled(cron = "0 0 0 0/1 * *")
	@Transactional
	public void deleteOrder() {
		log.info("크론 주문 삭제 스케줄러 실행....");
		orderMapper.deleteOrder();

	}
	
	// 낙찰 상품 주문 자동화 스케줄러
	@Scheduled(cron = "0 0 0/1 * * *")
	@Transactional
	public void addAuctionOrder() {
		
		log.info("크론 경매 스케줄러 실행....");
		// 1시간 이내에 경매가 마감된 상품 조회
		List<AuctionVO> auctionList = auctionMapper.auctionCloseList();
		for(AuctionVO auction : auctionList) {
			
			// 유찰인 경우 패스
			List<BidVO> bidList = bidMapper.bidList(auction.getApno());
			if(bidList.size() == 0) {
				continue;
			}
			
			// 낙찰자 추출
			BidVO bid = bidMapper.bestBidDetail(auction.getApno());
			Long mno = bid.getMno();
			
			// 낙찰자의 기본 배송지 추출
			AddressVO address = addressMapper.findDefaultAddress(mno);
			
			
			OrderVO order = OrderVO.builder()
					.ano(address.getAno())
					.mno(mno)
					.payment("포인트")
					.totalPrice(bid.getPrice())
					.status("상품준비중")
					.category("auction_product")
					.build();
			
			//주문 추가
			orderMapper.insertAuctionOrder(order);
			
			WinningBidVO winningBid = WinningBidVO.builder()
					.bno(bid.getBno())
					.ono(order.getOno())
					.build();
			
			// 주문에 담길 낙찰상품 추가
			winningBidMapper.insertWinningBid(winningBid);				
		}
	}
}
