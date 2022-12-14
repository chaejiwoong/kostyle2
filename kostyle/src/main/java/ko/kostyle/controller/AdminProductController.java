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
		// ????????? ??????
		model.addAttribute("cri", cri);
		// ??????????????????
		
		
		model.addAttribute("product", service.get(pno));
		
		
	}

	@GetMapping("/register") // ???????????? ???
	public void register() {

	}

	@PostMapping("/register") // ????????????
	@ResponseBody
	public String register(@RequestBody ProductDTO proDTO) {

		service.register(proDTO);

		return "ok";
	}

	@ResponseBody
	@PutMapping("/{pno}") // ??? ??????
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

	/* ?????? ?????? ????????? */
	@PostMapping(value="/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Product_ImgDTO>> upload(MultipartFile[] uploadFile) {
		
		/* ????????? ?????? ?????? */
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
		// ?????? ?????? ??????
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		String datePath = str.replace("-", File.separator);
		
		/* ?????? ?????? */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		/* ????????? ?????? ?????? ?????? */
		List<Product_ImgDTO> list = new ArrayList();
		// ????????? for
		for (MultipartFile multipartFile : uploadFile) {
			/* ????????? ?????? ?????? */
			Product_ImgDTO imgDTO = new Product_ImgDTO();
			
			
		
			
			/* ?????? ?????? */
			String uploadFileName = multipartFile.getOriginalFilename();	
			imgDTO.setFileName(uploadFileName);
			imgDTO.setFilePath(datePath);
			
			
			/* uuid ?????? ?????? ?????? */
			String uuid = UUID.randomUUID().toString();
			imgDTO.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* ?????? ??????, ?????? ????????? ?????? File ?????? */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* ?????? ?????? */
			try {
				multipartFile.transferTo(saveFile);
				
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				/* ?????? */
				double ratio = 3;
				/*?????? ??????*/
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
	
	/* ????????? ?????? ?????? */
	@PostMapping("/deleteImg")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/* ????????? ?????? ?????? */
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/* ?????? ?????? ?????? */
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
