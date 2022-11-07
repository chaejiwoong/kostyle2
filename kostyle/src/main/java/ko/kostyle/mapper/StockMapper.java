package ko.kostyle.mapper;

import ko.kostyle.domain.StockVO;

public interface StockMapper {
	
	void updateStock(StockVO vo);

	//재고 조회
	int stockAmount(StockVO vo);
}
