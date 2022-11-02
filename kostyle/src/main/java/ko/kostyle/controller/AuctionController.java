package ko.kostyle.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.Criteria;
import ko.kostyle.service.AttentionAuctionService;
import ko.kostyle.service.AuctionService;
import ko.kostyle.service.BidService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/auctions")
public class AuctionController {
	
	private final AuctionService auctionService;
	private final AttentionAuctionService attentionService;
	private final BidService bidService;
	
	// 메인 페이지 이동
	@GetMapping
	public String main(Criteria cri, Model model) {
		
		log.info("auction main controller..........");
		model.addAttribute("auctionDeadlineList", auctionService.getAuctionDeadlineList(cri));
		model.addAttribute("auctionProgressList", auctionService.getAuctionProgressList(cri));
		
		return "auctions/main";
	}
	
	// 관심 상품 등록 해제
	@PutMapping("/attention/{apno}")
	@ResponseBody
	public ResponseEntity<String> updateAttention(@PathVariable Long apno){
		
		log.info("auction updateAttention controller.......");
		attentionService.updateAttention(apno);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	// 경매 상품 상세
	@GetMapping("/{apno}")
	public String auctionDetail(@PathVariable Long apno, Model model) {
		
		log.info("auctionDetail Controller........");
		
		model.addAttribute("auction",auctionService.getAuctionDetail(apno));
		model.addAttribute("bids", bidService.getAuctionBidList(apno));
		
		return "auctions/detail";
	}
	
	
	

}
