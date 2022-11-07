package ko.kostyle.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.AttentionAuctionVO;
import ko.kostyle.dto.Criteria;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class AttentionAuctionServiceTest {

	@Autowired
	private AttentionAuctionService service;
	
	@Test
	public void upadteAttentionTest() {
		
		service.updateAttention(24L);
	}
}
