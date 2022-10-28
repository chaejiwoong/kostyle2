package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AuctionDTO;

public interface AuctionService {
	
	void insertAuction(AuctionDTO dto);
	
	List<AuctionDTO> getAuctionList();
}
