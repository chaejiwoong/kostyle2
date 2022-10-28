package ko.kostyle.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.AuctionVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class AuctionMapperTest {
	
	@Autowired
	private AuctionMapper mapper;
	
//	@Test
//	public void insertTest() {
//		
//		AuctionVO vo = AuctionVO.builder()
//				.name("테스트상품")
//				.start_price(1000)
//				.best_bid_price(1000)
//				.bid_unit(100)
//				.build();
//		
//		mapper.insertAuction(vo);
//	}
	
	@Test
	public void findTest() {
		mapper.auctionList().forEach(log::info);
		log.info(mapper.auctionImgDetail(8L));
	}
}
