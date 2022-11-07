package ko.kostyle.service;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.WinningBidDTO;

import java.util.List;

public interface AdminOrderService {

    public List<AdminOrderDTO> orderList(Criteria cri);

    public AdminOrderDTO orderDetail(Long ono);

    List<AdminOrderDetailDTO> orderDetails(Long ono);
    
    int getTotal(Criteria cri);
    
    WinningBidDTO getWinningBid(Long ono);
}
