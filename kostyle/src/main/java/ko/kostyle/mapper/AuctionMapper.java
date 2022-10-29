package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.domain.AuctionVO;
import ko.kostyle.dto.Criteria;

public interface AuctionMapper {
	
	void insertAuction(AuctionVO vo);
	
	void insertAuctionImg(AuctionImgVO vo);
	
	List<AuctionVO> auctionList(Criteria cri);
	
	AuctionVO auctionDetail(Long apno);
	
	List<AuctionImgVO> auctionImgDetail(Long apno);
	
	void updateAuction(AuctionVO vo);
	
	void deleteAuction(Long apno);
	
	void deleteAuctionImg(Long apno);
	
	int getTotal(Criteria cri);
	

}
