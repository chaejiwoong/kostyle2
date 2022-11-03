package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.OrderCancelDTO;

public interface AdminOrderCancelService {
	
	public void insertOrderCancel(OrderCancelDTO dto, Long odno);
	
	public List<OrderCancelDTO> getOrderCancelList(Criteria cri);
	
	public OrderCancelDTO getOrderCancelDetail(Long ocno);
	
	int getTotal(Criteria cri);
}
