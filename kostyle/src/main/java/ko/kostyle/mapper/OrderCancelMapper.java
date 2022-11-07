package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.OrderCancelVO;
import ko.kostyle.dto.Criteria;

public interface OrderCancelMapper {
	
	public void insertOrderCancel(OrderCancelVO vo);
	
	public List<OrderCancelVO> orderCancelList(Criteria cri);
	
	public OrderCancelVO orderCancelDetail(Long ocno);
	
	public void updateOrderPrice(@Param("price") int price ,@Param("ono") Long ono);
	
	int getTotal(Criteria cri);
}
