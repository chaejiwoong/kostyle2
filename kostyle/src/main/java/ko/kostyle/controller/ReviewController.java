package ko.kostyle.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.ReviewDTO;
import ko.kostyle.mapper.ReviewMapper;
import ko.kostyle.service.AuctionService;
import ko.kostyle.service.ReviewService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/reviews")
public class ReviewController {
	
	private final ReviewService reviewService;
	
	// 리뷰 등록 폼
	@GetMapping("/register")
	public String insertReviewForm(Model model, Long odno) {
		log.info("review insert Form.......");
		
		model.addAttribute("detail", reviewService.orderDetails(odno));
		
		return "reviews/register";
	}
	
	
	// 리뷰 등록
	@PostMapping("/register")
	@ResponseBody
	public ResponseEntity<String> insertReview(@RequestBody ReviewDTO dto){
		
		log.info("insertReview Controller......." + dto);
		
		reviewService.insertReview(dto);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
		
	}
	
	// 리뷰남기지 않은 주문상세 리스트
	@GetMapping("/unwritten")
	public String unwrittenReviewList(Model model) {
		
		log.info("unwrittenReviewList Controller.......");
		
		model.addAttribute("details", reviewService.unwrittenReviewList());
		
		return "reviews/unwritten";
	}
	
	// 리뷰남긴 주문상세 리스트
	@GetMapping("/write")
	public String writeReviewList(Model model) {
		
		log.info("writeReviewList Controller.......");
		
		model.addAttribute("details", reviewService.writeReviewList());
		
		return "reviews/write";
	}
	
	//리뷰 상세
	@GetMapping(value="/detail", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<ReviewDTO> reviewDetail(@RequestParam Long odno){
		return new ResponseEntity<ReviewDTO>(reviewService.reviewDetail(odno), HttpStatus.OK);
	}
}
