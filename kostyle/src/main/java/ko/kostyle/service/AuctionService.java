package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.BidDTO;
import ko.kostyle.dto.Criteria;

public interface AuctionService {
	
	void insertAuction(AuctionDTO dto);
	
	List<AuctionDTO> getAuctionList(Criteria cri);
	
	AuctionDTO getAuctionDetail(Long apno);
	
	void updateAuction(AuctionDTO dto);
	
	void deleteAuction(Long apno);
	
	int getTotal(Criteria cri);
	
	List<AuctionDTO> getAuctionProgressList(Criteria cri);
	
	List<AuctionDTO> getAuctionDeadlineList(Criteria cri);
	
	List<AuctionDTO> getAttentionList();
	
	// 입찰
	void auctionBid(BidDTO dto) throws Exception;
	
	// 회원이 입찰한 상품 목록 조회
	List<AuctionDTO> memberAuctionBidList();
}
