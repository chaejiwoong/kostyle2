package ko.kostyle.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
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
import ko.kostyle.dto.StockDTO;
import ko.kostyle.service.ProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/products")
@Log4j
public class ProductController {

	@Autowired
	private ProductService service;

	@GetMapping
	public String list(Model model, Criteria cri) {

		int total = service.getTotal(cri);
		model.addAttribute("product", service.productList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		return "admin/products/list";

	}

	@GetMapping("/get")
	public void get(@RequestParam("pno") Long pno, Model model) {
		model.addAttribute("product", service.get(pno));
	}

	@GetMapping("/register") // 상품등록 폼
	public void register() {

	}

	@PostMapping("/register") // 상품등록
	public String register(ProductDTO proDTO) {
		
		log.info("디티오 서비스 전------------ " + proDTO);
		service.register(proDTO);
	log.info("서비스 후 디티오 ------------" + proDTO);
		return "redirect:/admin/products";
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
//파일업로드
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<Product_ImgVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {

		String uploadFolder = "C:\\upload";

//		폴더경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
//		폴더생성
		File filePath = new File(uploadFolder, datePath);
		

		if (filePath.exists() == false) {
			filePath.mkdirs();
		}
		List<Product_ImgVO> list = new ArrayList();

		for (MultipartFile multipartFile : uploadFile) {
			Product_ImgVO imgVO = new Product_ImgVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			imgVO.setFileName(uploadFileName);
			imgVO.setFilePath(datePath);

			String uuid = UUID.randomUUID().toString();
			imgVO.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;

			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(filePath, uploadFileName);

			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);

				File thumbnailFile = new File(filePath, "s_" + uploadFileName);

				BufferedImage bo_image = ImageIO.read(saveFile);

				/* 비율 */
				double ratio = 3;
				/* 넓이 높이 */
				int width = (int) (bo_image.getWidth() / ratio);
				int height = (int) (bo_image.getHeight() / ratio);
				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);

				Graphics2D graphic = bt_image.createGraphics();

				graphic.drawImage(bo_image, 0, 0, 300, 500, null);

				ImageIO.write(bt_image, "jpg", thumbnailFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			list.add(imgVO);
		}
		ResponseEntity<List<Product_ImgVO>> result = new ResponseEntity<List<Product_ImgVO>>(list, HttpStatus.OK);
		return result;
	}

	/*
	 * @GetMapping("/display") public ResponseEntity<byte[]> getImage(String
	 * fileName) {
	 * 
	 * File file = new File("C:\\upload\\" + fileName);
	 * 
	 * ResponseEntity<byte[]> result = null;
	 * 
	 * try {
	 * 
	 * HttpHeaders header = new HttpHeaders(); header.add("Content-type",
	 * Files.probeContentType(file.toPath())); result = new
	 * ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } return result; }
	 */

}
