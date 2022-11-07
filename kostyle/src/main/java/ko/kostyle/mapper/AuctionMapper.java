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
	
	// 낙찰상품 조회
	AuctionVO auctionDetailByBno(Long bno);
	
	List<AuctionImgVO> auctionImgDetail(Long apno);
	
	void updateAuction(AuctionVO vo);
	
	void updatePrice(AuctionVO vo);
	
	void deleteAuction(Long apno);
	
	void deleteAuctionImg(Long apno);
	
	int getTotal(Criteria cri);
	
	List<AuctionVO> auctionProgressList(Criteria cri);
	
	List<AuctionVO> auctionDeadlineList(Criteria cri);
	
	// 경매관심목록 조회
	List<AuctionVO> attentionList(Long mno);
	// 한시간 내로 경매가 마감된 상품 조회
	List<AuctionVO> auctionCloseList();
	
	// 회원이 입찰한 상품목록 조회
	List<AuctionVO> memberAuctionBidList(Long mno);
	

}
