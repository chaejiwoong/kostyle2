package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.dto.BidDTO;
import ko.kostyle.dto.OrderPayDTO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class OrderServiceTest {
	
	@Autowired
	private OrderService orderService;

	
	//입찰 테스트
	@Test
	public void orderPayTest() {
		
		List<OrderPayDTO> list = new ArrayList<OrderPayDTO>();
		
		OrderPayDTO orderPay = OrderPayDTO.builder()
				.pno(17L)
				.amount(1)
				.price(20000)
				.p_size("M")
				.build();
		
		OrderPayDTO orderPay2 = OrderPayDTO.builder()
				.pno(21L)
				.amount(1)
				.price(20000)
				.p_size("S")
				.build();
		list.add(orderPay);
		list.add(orderPay2);
	}
}
