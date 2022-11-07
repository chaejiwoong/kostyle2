package ko.kostyle.service;

import java.util.List;

import ko.kostyle.domain.CartListVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.ProductVO;

public interface ProductService {
	
	
	public int productInsert(ProductVO item);
	
	public List<ProductVO> productList();
	
	List<CartListVO> selectBycpno(long cpno);

	OrderDetailVO selectByPno(long pno);
}
