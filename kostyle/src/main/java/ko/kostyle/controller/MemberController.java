package ko.kostyle.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import ko.kostyle.dto.BidDTO;
import ko.kostyle.dto.members.MemberUpdateDTO;
import ko.kostyle.service.AuctionService;
import ko.kostyle.service.BidService;
import ko.kostyle.service.MemberService;

import java.util.List;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;
    private final AuctionService auctionService;
    private final BidService bidService;

    // 마이페이지 이동
    @GetMapping("/myPage")
    public String myPage(Model model) {
        model.addAttribute("member", memberService.getMyInfo());

        return "members/myPage";
    }

    // 회원 수정 폼
    @GetMapping
    public String updateMember() {
    	
    
        return "members/updateMember";
       
    }

    // 회원 수정
    @PutMapping
    @ResponseBody
    public String updateInfo(@Valid @RequestBody MemberUpdateDTO dto) {
        memberService.updateInfo(dto);

        return "ok";
    }

    // 회원 탈퇴
    @DeleteMapping
    @ResponseBody
    public String deleteMember() {
        log.info("delete member....");
        memberService.deleteMember();
        return "ok";
    }
    
    // 관심경매페이지 이동
    @GetMapping("/attention")
    public String memberAttentionAuction(Model model) {
    	
    	log.info("memberAttentionAuctionList controller.......");
    	
    	model.addAttribute("auctions", auctionService.getAttentionList());
    	
    	return "members/attention";
    }
    
    // 입찰내역 페이지 이동
    @GetMapping("/bidHistory")
    public String memberBidAuctionHistory(Model model) {
    	
    	log.info("memberBidAuctionHistory controller.......");
    	
    	model.addAttribute("auctions", auctionService.memberAuctionBidList());
    	
    	return "members/bidHistory";
    }
    
    // 회원이 입찰한 상품의 입찰 내역 가져오기
    @GetMapping(value = "/bidHistory/{apno}", produces = "application/json; charset=UTF-8")
    @ResponseBody
    public ResponseEntity<List<BidDTO>> memberBidHistory(@PathVariable Long apno){
    	
    	log.info("memberBidHistory controller.......");
    	
    	return new ResponseEntity<List<BidDTO>>(bidService.bidHistoryList(apno), HttpStatus.OK);
    }
}
