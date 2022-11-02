package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.DeliveryVO;

public interface DeliveryMapper {
	void insertDelivery(DeliveryVO vo);
	
	List<DeliveryVO> getDeliveryList();
}
