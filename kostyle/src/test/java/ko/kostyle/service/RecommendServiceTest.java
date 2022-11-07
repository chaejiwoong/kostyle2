package ko.kostyle.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.dto.AdminProductDTO;
import ko.kostyle.mapper.MemberMapperTest;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class RecommendServiceTest {
	
	@Autowired
	private RecommendService recommendService;
	
	@Test
	public void cartRecommendTest() {
		
		recommendService.cartRecommendService(15L).forEach(log::info);
		
	}
}
