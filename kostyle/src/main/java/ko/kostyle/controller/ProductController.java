package ko.kostyle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ko.kostyle.dto.Criteria;
import ko.kostyle.service.ProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/products")
@Log4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@GetMapping("/get")
	public void get(@RequestParam("pno") Long pno, Model model, Criteria cri) {
		// 페이지 정보
		model.addAttribute("cri", cri);
		// 선택상품정보
		model.addAttribute("product", service.get(pno));
		
		
	}
	
	

}
