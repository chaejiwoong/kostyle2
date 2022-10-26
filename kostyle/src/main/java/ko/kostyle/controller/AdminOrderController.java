package ko.kostyle.controller;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.service.AdminOrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/orders")
public class AdminOrderController {

    private final AdminOrderService orderService;

    // 주문목록 가져오기
    @GetMapping
    public String orderList(Model model) {
        log.info("get Admin OrderList.....");

        model.addAttribute("orders", orderService.orderList());
       

        return "admin/orderList";
    }

    @GetMapping("/{ono}")
    public String orderDetail(@PathVariable Long ono, Model model) {
        // 주문 정보 저장
        model.addAttribute("order", orderService.orderDetail(ono));
        // 주문 상세 저장
        List<AdminOrderDetailDTO> list = orderService.orderDetails(ono); 
        list.forEach(log::info);
        model.addAttribute("details", list);
        
        return "admin/orderDetailList";
    }
}
