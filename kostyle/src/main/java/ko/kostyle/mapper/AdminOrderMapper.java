package ko.kostyle.mapper;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.ProductVO;

import java.util.List;

public interface AdminOrderMapper {

    List<OrderVO> orderList();

    OrderVO getOrder(Long ono);

    AddressVO addressDetail(Long ano);

    List<OrderDetailVO> orderDetails(Long ono);
    
    ProductVO productDetail(Long odno);
    
    OrderDetailVO getOrderDetail(Long odno);

}
