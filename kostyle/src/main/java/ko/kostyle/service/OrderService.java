package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.OrderCancelDTO;
import ko.kostyle.dto.OrderDTO;
import ko.kostyle.dto.OrderDetailDTO;
import ko.kostyle.dto.WinningBidDTO;

public interface OrderService {

    List<OrderDTO> orderList(Criteria cri);

    OrderDetailDTO firstOrderDetail(Long ono);
    
    OrderDetailDTO orderDetail(Long odno);

    List<OrderDetailDTO> orderDetails(Long ono);
    
    int getTotal(Criteria cri);
    
    WinningBidDTO getWinningBid(Long ono);
    
    //주문 취소
    void orderCancel(OrderCancelDTO dto);
}
