package ko.kostyle.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.Product_ImgVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class ProductMapperTest {
	
	@Autowired
	ProductMapper mapper;
			
			
	/* 이미지 등록 */
	@Test
	public void imageEnrollTest() {
		
		Product_ImgVO vo = new Product_ImgVO();
		
		
		vo.setPno(11L);
		vo.setFileName("test");
		vo.setFilePath("test2");
		vo.setUuid("test3");
		
		mapper.imgInsert(vo);
		
	}

}
