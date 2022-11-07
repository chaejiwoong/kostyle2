package ko.kostyle.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.ServiceCenterVo;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class ServicecenterMapperTest {
	
	@Autowired
	private ServiceCenterMapper mapper;
	
	@Test
	public void testRead() {
		ServiceCenterVo vo = mapper.NoticeDetail(63L);
		log.info(vo);
	}
	
//	@Test
//	public void testDelete() {
//		log.info("DELETE : " + mapper.deleteNotice(62L));
//	}
}
