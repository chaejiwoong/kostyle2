package ko.kostyle.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.ImgDTO;
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
	
	@GetMapping("/register")
	public String insertAuctionForm() {
		log.info("admin insertAuctionForm.........");
		return "admin/auction/auctionRegister";
	}
	
	@PostMapping("/register")
	@ResponseBody
	public ResponseEntity<String> insertAuction(@RequestBody AuctionDTO dto){
		
		log.info("admin insertAuction.......");
		log.info("AuctionDTO : " + dto);
		
		auctionService.insertAuction(dto);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	@PostMapping("/upload")
    @ResponseBody
    public ResponseEntity<List<ImgDTO>> uploadFile(MultipartFile[] uploadFile) {
		
		log.info("uploadFile Controller........");
		
		return new ResponseEntity<List<ImgDTO>>(uploadService.upload(uploadFile), HttpStatus.OK);
    }
	
}
