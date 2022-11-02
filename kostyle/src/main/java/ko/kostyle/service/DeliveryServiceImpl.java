package ko.kostyle.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.DeliveryVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.DeliveryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Service
public class DeliveryServiceImpl implements DeliveryService{
	
	private final DeliveryMapper deliveryMapper;
	private final AdminOrderMapper orderMapper;
	
	
	@Override
	@Transactional
	public void startDelivery(Long ono) {
		
		log.info("start Delivery............" + ono);
		
		OrderVO order = orderMapper.getOrder(ono);
		
		if(!order.getStatus().equals("상품준비중")) {
			throw new RuntimeException("잘못된 요청입니다.");
		}
		
		DeliveryVO vo = new DeliveryVO();
		vo.setOno(ono);

		order.setStatus("배송중");
		orderMapper.updateOrderStatus(order);
		deliveryMapper.insertDelivery(vo);
	}

}
