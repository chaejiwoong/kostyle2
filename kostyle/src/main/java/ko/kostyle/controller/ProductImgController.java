package ko.kostyle.controller;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.Product_ImgDTO;
import ko.kostyle.mapper.ProductImgMapper;
import ko.kostyle.service.ProductImgService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member/products")
@Log4j
public class ProductImgController {
	
	@Autowired
	private ProductImgService imgService;
	
	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName){
		log.info("ddddddddddddddddddddddddddddddddddddddddddd"+fileName);
		File file = new File("c:\\upload\\" + fileName);
		
		ResponseEntity<byte[]> result = null;
		
		try {
			
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-type", Files.probeContentType(file.toPath()));
			
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//이미지 반환
	@GetMapping(value = "getImgList",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Product_ImgDTO>> getImgList(Long pno){
		return new ResponseEntity<List<Product_ImgDTO>>(imgService.imgList(pno), HttpStatus.OK);
	}
	

}
