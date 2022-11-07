package ko.kostyle.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.QuestionDTO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class QuestionMapperTest {
	
	@Autowired
	private QuestionMapper mapper;
	
//	 @Test public void testRead() {
//		 log.info("리스트임");
//	 mapper.getQuestionListWithPaging().forEach(board -> log.info("안녕" + board)); }
	 
//	
//	@Test
//	public void insertTest() {
//		QuestionVO vo = new QuestionVO();
//		vo.setMno(1L);
//		vo.setTitle("문의사항입니다");
//		vo.setContent("판매 어떻게 해야할까요");
//		mapper.insertQuestion(vo);
//		log.info("문의 작성하기");
//		log.info(vo);
//	}
	@Test
	public void selectTestKey() {
		QuestionVO vo = new QuestionVO();
		vo.setMno(2L);
		vo.setTitle("문의사항입니다");
		vo.setContent("판매 어떻게 해야할까요");
		mapper.insertQuestionKey(vo);
		log.info("문의 작성하기");
	}
	

	
}
