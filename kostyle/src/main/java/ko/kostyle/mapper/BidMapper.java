package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.BidVO;

public interface BidMapper {

	void insertBid(BidVO vo);
	
	List<BidVO> bidList(Long apno);
	
	BidVO bestBidDetail(Long apno);
	
	List<BidVO> bidHistoryList(@Param("mno")Long mno, @Param("apno") Long apno);
	
	// 경매상품의 입찰내역 최근 10건 조회
	List<BidVO> auctionBidList(Long apno);
}
