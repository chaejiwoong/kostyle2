package ko.kostyle.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.DeliveryVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.DeliveryMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
public class Scheduler {
	
	@Autowired
	private AdminOrderMapper orderMapper;
	
	@Autowired
	private DeliveryMapper deliveryMapper;
	
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
}
