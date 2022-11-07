package ko.kostyle.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.AuctionVO;
import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.BidDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.OrderCancelMapperTest;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class AuctionServiceTest {
		
	@Autowired
	private AuctionService service;
	
//	@Test
//	public void insertAuctionService() {
//		AuctionVO vo = AuctionVO.builder()
//				.name("테스트상품")
//				.start_price(1000)
//				.best_bid_price(1000)
//				.bid_unit(100)
//				.build();
//		
//		AuctionDTO dto= new AuctionDTO();
//		dto.setName("테스트DTO2");
//		dto.setStart_price(1001);
//		dto.setBest_bid_price(1001);
//		dto.setBid_unit(100);
//		
//		service.insertAuction(dto);
//		log.info("success");
//		
//	}
	
	
	//입찰 테스트
	@Test
	public void bidTest() {
		
		BidDTO dto = new BidDTO();
		dto.setApno(29L);
		dto.setPrice(140000);
	}
}
