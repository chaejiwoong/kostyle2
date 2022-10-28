package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.domain.AuctionVO;

public interface AuctionMapper {
	
	void insertAuction(AuctionVO vo);
	
	void insertAuctionImg(AuctionImgVO vo);
	
	List<AuctionVO> auctionList();
	
	List<AuctionImgVO> auctionImgDetail(Long apno);

}
