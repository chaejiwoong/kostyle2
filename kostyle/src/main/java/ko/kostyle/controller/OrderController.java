package ko.kostyle.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.MessageDTO;
import ko.kostyle.dto.OrderCancelDTO;
import ko.kostyle.dto.OrderDetailDTO;
import ko.kostyle.dto.OrderPayDTO;
import ko.kostyle.dto.OrderRequestDTO;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.dto.WinningBidDTO;
import ko.kostyle.service.AddressService;
import ko.kostyle.service.AuctionService;
import ko.kostyle.service.AuthService;
import ko.kostyle.service.BidService;
import ko.kostyle.service.MemberService;
import ko.kostyle.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/orders")
@RequiredArgsConstructor
@Log4j
public class OrderController {
	
	private final OrderService orderService;
	private final AddressService addressService;
	private final MemberService memberService;
	private final AuthService authService; 
	
	@GetMapping
	public String getOrderList(Criteria cri, Model model) {
		
		log.info("member OrderList Controller.....");
		
        int total = orderService.getTotal(cri);

        model.addAttribute("pageMaker", new PageDTO(cri, total));

		model.addAttribute("orders",orderService.orderList(cri));
		
		return "orders/orderList";
	}
	
	@GetMapping(value = "/{ono}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity getOrderDetails(@PathVariable Long ono, @RequestParam String category){
		
        // 주문 상세 저장
        return category.equals("구매") ?
        		new ResponseEntity<List<OrderDetailDTO>>(orderService.orderDetails(ono),HttpStatus.OK):
        		new ResponseEntity<WinningBidDTO>(orderService.getWinningBid(ono), HttpStatus.OK);
        
	}
	
	// 주문 취소 폼
	@GetMapping("/cancel/{odno}")
	public String orderCancelForm(@PathVariable Long odno, Model model) {
		
		model.addAttribute("detail", orderService.orderDetail(odno));
		
		return "orders/orderCancel";
	}
	
	@PostMapping("/cancel/{odno}")
	@ResponseBody
	public ResponseEntity<String> orderCancelForm(@PathVariable Long odno, @RequestBody OrderCancelDTO dto) {
		
		log.info("member OrderCancel Controller.....");
		
		dto.setOdno(odno);
		orderService.orderCancel(dto);
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	// 주문결제 창
	@GetMapping("/pay")
	public String orderPayForm(OrderPayDTO dto, Model model) {
		
		log.info("member orderPay Controller.....");
		try {
			// 주문 상세 리스트
			model.addAttribute("details", orderService.OrderPayList(dto));
			// 주문에 출력할 기본 배송지
			model.addAttribute("address", addressService.findDefaultAddress());
			
			
			// 주문에 출력할 회원 포인트
			model.addAttribute("member",memberService.getMyInfo());			
		//잘못된 접근 시 메인페이지로 보내기.	
		}catch(Exception e) {
			return "redirect:/main";
		}

		return "orders/pay";
	}
	
	// 주문 결제
	@PostMapping(value="/pay", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity orderPay(@RequestBody OrderRequestDTO dto){
		
		log.info("orderPay Controller.........");
		log.info("dto : " + dto);
		try {
			orderService.orderPayService(dto);
			if(dto.getPay().equals("card")) {
				authService.orderEmail(dto);
			}
		}catch (Exception e) {
			log.info(e.getMessage());
			return new ResponseEntity<MessageDTO>(new MessageDTO(e.getMessage()), HttpStatus.BAD_REQUEST);
		}

		
		return new ResponseEntity<MessageDTO>(new MessageDTO("ok"), HttpStatus.OK);
	}

}
