package ko.kostyle.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.mapper.QuestionMapperTest;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class QuestionServiceTexts {
	
	@Autowired
	private QuestionService service;
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info("안녕ㅂ" + board));
////		service.getList().forEach(board -> log.info(board));
////      service.getList().forEach(log::info); 좋은 람다식
//  }

}
