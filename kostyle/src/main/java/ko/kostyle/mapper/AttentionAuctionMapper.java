package ko.kostyle.mapper;

import ko.kostyle.domain.AttentionAuctionVO;

public interface AttentionAuctionMapper {
	
	void insertAttention(AttentionAuctionVO vo);
	
	AttentionAuctionVO existByAttention(AttentionAuctionVO vo);
	
	void deleteAttention(AttentionAuctionVO vo);
}
