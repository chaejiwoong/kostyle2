package ko.kostyle.service;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;

import java.util.List;

public interface AdminOrderService {

    public List<AdminOrderDTO> orderList();

    public AdminOrderDTO orderDetail(Long ono);

    List<AdminOrderDetailDTO> orderDetails(Long ono);
}
