package ko.kostyle.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ko.kostyle.domain.CartListVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.service.CartService;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop")
@RequiredArgsConstructor
public class CartController {

	private final CartService service;
	private final HttpSession session;

	@PostMapping("/cartAdd")
	public String addCart(@RequestParam(defaultValue = "0") Long pno, @RequestParam(defaultValue = "0") int amount) {

		log.info(pno);
		log.info(amount);
		// 로그인한 회원을 세션에서 꺼내오기
		MemberVO vo = (MemberVO) session.getAttribute("loginUser");
		Long mno = vo.getMno(); // 로그인한 사람꺼로 카트 들어감.
		// Long mno = 2; //회원번호가 2인 사람으로 테스트

		CartListVO CartListVO = new CartListVO();
		CartListVO.setPno(pno);
		CartListVO.setAmount(amount);
		CartListVO.setMno(mno);

		// 장바구니에 상품 추가
		service.addCart(CartListVO);

		// 장바구니 목록 가져오기
		// List<CartListVO> cartArr=shopService.selectCartView(idx_fk);
		// session.setAttribute("cart", cartArr);
		// 여기서 forward 이동하면 브라우저 새로고침시 계속 상품이 추가된다.
		// 이 경우 forward 이동을 하면 안됨!!!!!
		// return "shop/cartList";
		// "WEB-INF/vies/shop/cartList.jsp"

		return "redirect:cartList"; // 컨트롤러와 매핑된 이름
	}

	@GetMapping("/cartList")
	public String showCart(Model model, CartListVO vo) throws Exception {
		log.info("cartList...");

		Long mno = SecurityUtil.getCurrentMemberId();
		
		vo.setMno(mno);
		List<CartListVO> cartArr = service.getCartList(mno);

		model.addAttribute("cartList", cartArr);
		log.info(cartArr);
		return "shop/cartList";
	}

	@GetMapping("/cartDel")
	public String cartDelete(@RequestParam(defaultValue = "0") Long cpno) {
		if (cpno == 0) {
			return "redirect:cartList";
		}
		int n = service.delCart(cpno);
		return "redirect:cartList";
	}

	@PostMapping("/cartEdit")
	public String cartEdit(@ModelAttribute CartListVO cvo) {
		log.info(cvo); // cpno, amount 넘어옴

		service.editCart(cvo);

		return "redirect:cartList";
	}

	/** 수량을 음수로 입력했을 때 예외 처리 */
	@ExceptionHandler(NumberFormatException.class)
	public String exceptionHandler(Exception ex) {
		return "common/errorAlert";
	}
}
