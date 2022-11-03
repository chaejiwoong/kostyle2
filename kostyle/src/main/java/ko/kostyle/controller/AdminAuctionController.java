package ko.kostyle.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ImgDTO;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.dto.members.MemberDTO;
import ko.kostyle.service.AuctionService;
import ko.kostyle.service.UploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/auctions")
public class AdminAuctionController {
	
	private final AuctionService auctionService;
	private final UploadService uploadService;
	
	// 상품 등록 폼
	@GetMapping("/register")
	public String insertAuctionForm() {
		log.info("admin insertAuctionForm.........");
		return "admin/auction/auctionRegister";
	}
	
	// 상품 등록
	@PostMapping("/register")
	@ResponseBody
	public ResponseEntity<String> insertAuction(@RequestBody AuctionDTO dto){
		
		log.info("admin insertAuction.......");
		log.info("AuctionDTO : " + dto);
		
		auctionService.insertAuction(dto);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	// 이미지 업로드
	@PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<List<ImgDTO>> uploadFile(MultipartFile[] uploadFile) {
		
		log.info("uploadFile Controller........");
		
		return new ResponseEntity<List<ImgDTO>>(uploadService.upload(uploadFile), HttpStatus.OK);
    }
	
	// 상품 목록
	@GetMapping
	public String auctionList(Criteria cri, Model model) {
		
		log.info("admin auction getList.........");
		
		List<AuctionDTO> list = auctionService.getAuctionList(cri);
		
		model.addAttribute("auctions", list);
		

        int total = auctionService.getTotal(cri);
        System.out.println("total = " + total);
        
        model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "admin/auction/auctionList";
	}
	
	// 상품 상세
	@GetMapping("/{apno}")
	public String auctionDetail(@PathVariable Long apno, Model model) {
		
		log.info("admin auction auctionDetail............");
		
		model.addAttribute("auction", auctionService.getAuctionDetail(apno));
		
		return "admin/auction/auctionDetail";
	}
	
	// 상품 수정
	@PutMapping("/{apno}")
	@ResponseBody
	public ResponseEntity<String> updateAuction(@PathVariable Long apno, @RequestBody AuctionDTO dto){
		
		log.info("admin updateAuction Controller............");
		auctionService.updateAuction(dto);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	// 상품 삭제
	@DeleteMapping("/{apno}")
	@ResponseBody
	public ResponseEntity<String> deleteAuction(@PathVariable Long apno){
		log.info("admin deleteAuction Controller..........");
		auctionService.deleteAuction(apno);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}

	
}
