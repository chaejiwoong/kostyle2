package ko.kostyle.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.service.ProductService;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/main")
@Log4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	
	@GetMapping
	public String list(Model model, Criteria cri,HttpServletRequest request, HttpServletResponse response) {
		cri.setAmount(4);
		int total = service.getTotal(cri);
		model.addAttribute("product", service.productList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("hitImg",service.productListHit());
		model.addAttribute("day",service.productListDay());
		
		
		   // 쿠키 주기
	      Cookie cookie = new Cookie("listCookie", "");
	      cookie.setPath("/");
	      response.addCookie(cookie);
	      
		return "/products/main";

	}
	
	@GetMapping("/product")

	public String get(@RequestParam("pno") Long pno, Model model, Criteria cri,   @CookieValue(name = "listCookie", required = false) Cookie cookie, HttpServletResponse response) {
	      cri.setAmount(4);
	   
		 if (cookie != null) {
	         service.updateHitcount(pno);
	         
	         // 쿠키 삭제 -> 도메인, 경로 지정해줘야한다
	         cookie.setMaxAge(0);
	         cookie.setPath("/");
	         
	           
	         response.addCookie(cookie);
	      }
			// 페이지 정보
			model.addAttribute("cri", cri);
			// 선택상품정보
			model.addAttribute("product", service.get(pno));
			
			//조회수 순 상품 보여죽;
			model.addAttribute("hitImg",service.productListHit());
			
			//신상순
			model.addAttribute("day",service.productListDay());
			


		return "/products/mainGet";
	
	}
	


	
	
}
