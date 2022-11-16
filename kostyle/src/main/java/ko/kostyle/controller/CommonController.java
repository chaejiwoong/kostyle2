package ko.kostyle.controller;

import java.io.File;
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
import ko.kostyle.service.ProductImgService;
import ko.kostyle.service.UploadService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/commons")
public class CommonController {
	
	private final ProductImgService imgService;
	
	private final UploadService uploadService;
	
    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {

        return uploadService.showImg(fileName);
    }

	//이미지 반환
	@GetMapping(value = "getImgList",  produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Product_ImgDTO>> getImgList(Long pno){
		return new ResponseEntity<List<Product_ImgDTO>>(imgService.imgList(pno), HttpStatus.OK);
	}
}
