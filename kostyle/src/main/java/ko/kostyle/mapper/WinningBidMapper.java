package ko.kostyle.mapper;

import ko.kostyle.domain.WinningBidVO;

public interface WinningBidMapper {
	
	void insertWinningBid(WinningBidVO vo);
	
	WinningBidVO winningBidDetail(Long ono);
}
