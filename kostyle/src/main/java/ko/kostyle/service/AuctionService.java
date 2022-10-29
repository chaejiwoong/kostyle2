package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.Criteria;

public interface AuctionService {
	
	void insertAuction(AuctionDTO dto);
	
	List<AuctionDTO> getAuctionList(Criteria cri);
	
	AuctionDTO getAuctionDetail(Long apno);
	
	void updateAuction(AuctionDTO dto);
	
	void deleteAuction(Long apno);
	
	int getTotal(Criteria cri);
}
