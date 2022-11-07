package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.BidDTO;

public interface BidService {

	// 회원이 입찰한 상품의 입찰내역 가져오기
	List<BidDTO> bidHistoryList(Long apno);
	
	// 회원이 입찰한 상품내역 가져오기
	List<BidDTO> getAuctionBidList(Long apno);
}
