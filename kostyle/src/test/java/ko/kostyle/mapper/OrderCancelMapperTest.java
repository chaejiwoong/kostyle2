package ko.kostyle.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.OrderCancelVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class OrderCancelMapperTest {
	
	@Autowired
	private OrderCancelMapper mapper;
	
//	@Test
//	public void insertTest() {
//		OrderCancelVO vo = new OrderCancelVO();
//		
//		vo.setOdno(1L);
//		vo.setCategory("환불");
//		vo.setReason("관리자취소");
//		
//		mapper.insertOrderCancel(vo);
//	}
	
//	@Test
//	public void orderCancelListTest() {
//		
//		mapper.orderCancelList().forEach(log::info);
//	}
	
	@Test
	public void orderCancelDetailTest() {
		
		mapper.orderCancelDetail(1L);
	}
	

}
