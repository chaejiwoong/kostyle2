package ko.kostyle.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.BidDTO;
import ko.kostyle.dto.MessageDTO;
import ko.kostyle.service.AuctionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/bids")
public class BidController {
	
	private final AuctionService auctionService;
	
	@PostMapping(value = "/{apno}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<MessageDTO> auctionBid(@PathVariable Long apno, @RequestBody BidDTO dto){
		
		log.info("auction bid controller........");
		log.info("bidDTO : " + dto);
		try {
			auctionService.auctionBid(dto);
		}catch(Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<MessageDTO>(new MessageDTO(e.getMessage()), HttpStatus.BAD_REQUEST);
		}

		
		return new ResponseEntity<MessageDTO>(new MessageDTO("ok"), HttpStatus.OK);
	}
}
