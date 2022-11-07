package ko.kostyle.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
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

import ko.kostyle.domain.Product_ImgVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.dto.ProductDTO;
import ko.kostyle.dto.Product_ImgDTO;
import ko.kostyle.dto.StockDTO;
import ko.kostyle.service.ProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/products")
@Log4j
public class AdminProductController {

	@Autowired
	private ProductService service;

	@GetMapping
	public String list(Model model, Criteria cri) {
		cri.setAmount(12);
		int total = service.getTotal(cri);
		model.addAttribute("product", service.productList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		

		return "admin/products/list";

	}

	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("pno") Long pno, Model model, Criteria cri) {
		// 페이지 정보
		model.addAttribute("cri", cri);
		// 선택상품정보
		
		
		model.addAttribute("product", service.get(pno));
		
		
	}

	@GetMapping("/register") // 상품등록 폼
	public void register() {

	}

	@PostMapping("/register") // 상품등록
	@ResponseBody
	public String register(@RequestBody ProductDTO proDTO) {

		service.register(proDTO);

		return "ok";
	}

	@ResponseBody
	@PutMapping("/{pno}") // 글 수정
	public ResponseEntity<String> modify(@RequestBody ProductDTO proDTO, @PathVariable("pno") Long pno) {

		proDTO.setPno(pno);
		
		

		return service.modify(proDTO) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}

	@ResponseBody
	@DeleteMapping("/{pno}")
	public String remove(@PathVariable("pno") Long pno) {

		service.remvove(pno);

		return "OK";
	}

	/* 첨부 파일 업로드 */
	@PostMapping(value="/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Product_ImgDTO>> upload(MultipartFile[] uploadFile) {
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(!type.startsWith("image")) {
				
				List<Product_ImgDTO> list = null;
				return new ResponseEntity<List<Product_ImgDTO>>(list, HttpStatus.BAD_REQUEST);
				
			}
			
		}
		log.info("uploadAjaxActionPOST..........");
		
		String uploadFolder = "C:\\upload";
		// 날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* 이미저 정보 담는 객체 */
		List<Product_ImgDTO> list = new ArrayList();
		// 향상된 for
		for (MultipartFile multipartFile : uploadFile) {
			/* 이미저 정보 객체 */
			Product_ImgDTO imgDTO = new Product_ImgDTO();
			
			
		
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();	
			imgDTO.setFileName(uploadFileName);
			imgDTO.setFilePath(datePath);
			
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			imgDTO.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				/* 비율 */
				double ratio = 3;
				/*넓이 높이*/
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);	
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
								
				Graphics2D graphic = bt_image.createGraphics();
				
				graphic.drawImage(bo_image, 0, 0,width,height, null);
					
				ImageIO.write(bt_image, "jpg", thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			} 
			list.add(imgDTO);
		}
		
		return new ResponseEntity<List<Product_ImgDTO>>(list, HttpStatus.OK);
		
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteImg")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* 썸네일 파일 삭제 */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* 원본 파일 삭제 */
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
			
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	



}
