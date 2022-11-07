package ko.kostyle.mapper;

import ko.kostyle.domain.ProductVO;

public interface ProductMapper {
	/* 상품 정보 */
	public ProductVO getProductInfo(long pno);	
}
