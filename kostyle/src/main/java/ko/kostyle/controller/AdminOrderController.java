package ko.kostyle.controller;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.service.AdminOrderService;
import ko.kostyle.service.DeliveryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/orders")
public class AdminOrderController {

    private final AdminOrderService orderService;
    private final DeliveryService deliveryService;

    // 주문목록 가져오기
    @GetMapping
    public String orderList(Criteria cri, Model model) {
        log.info("get Admin OrderList.....");
        
        List<AdminOrderDTO> list = orderService.orderList(cri);
        
        int total = orderService.getTotal(cri);

        model.addAttribute("orders", list);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
       

        return "admin/orderList";
    }

    @GetMapping("/{ono}")
    public String orderDetail(@PathVariable Long ono, Model model) {
        // 주문 정보 저장
    	AdminOrderDTO order = orderService.orderDetail(ono);
        model.addAttribute("order", order);
        // 주문 상세 저장
        if(order.getCategory().equals("product")) {
        	log.info(orderService.orderDetails(ono));
            model.addAttribute("details", orderService.orderDetails(ono));
        }else {
        	model.addAttribute("winningBid", orderService.getWinningBid(ono));
        }

        
        return "admin/orderDetailList";
    }
    
    @PostMapping("/delivery/{ono}")
    @ResponseBody
    public ResponseEntity<String> startDelivery(@PathVariable Long ono) {
    	
    	log.info("startDelivery Controller..........");
    	
    	deliveryService.startDelivery(ono);
    	
    	return new ResponseEntity<String>("ok", HttpStatus.OK);
    }
}
