package ko.kostyle.mapper;

import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.ProductVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class RecommendMapperTest {
	
	@Autowired
	private RecommendMapper recommendMapper;
	
	@Test
	public void cartRecommend() {

		ProductVO vo = new ProductVO();
		vo.setGender("F");
		vo.setSeason(2);

		log.info(recommendMapper.cartRecommendProduct(vo));
		
	}

}
