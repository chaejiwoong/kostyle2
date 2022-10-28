package ko.kostyle.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.OrderCancelDTO;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.service.AdminOrderCancelService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/orderCancels")
public class AdminOrderCancelController {
	
	private final AdminOrderCancelService service;
	
	
	// 주문 취소 목록 조회
	@GetMapping
	public String orderCancelList(Criteria cri,Model model) {
		
		log.info("admin orderCancel list........");
		
		List<OrderCancelDTO> list = service.getOrderCancelList(cri);
		
		int total = service.getTotal(cri);
		
		model.addAttribute("orderCancels", list);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		return "admin/orderCancelList";
	}
	
	// 주문 취소 상세 조회
	@GetMapping("/{ocno}")
	public String orderCancelDetail(@PathVariable Long ocno, Model model) {
		
		log.info("admin orderCancel Detail.......");
		
		model.addAttribute("orderCancel", service.getOrderCancelDetail(ocno));
		
		return "admin/orderCancelDetail";
	}
	
	// 주문 취소
	@PostMapping("/{odno}")
	@ResponseBody
	public ResponseEntity<String> insertOrderCancel(@RequestBody OrderCancelDTO dto, @PathVariable Long odno) {
		
		log.info("insert admin orderCancel..........");
		
		service.insertOrderCancel(dto, odno);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
}
