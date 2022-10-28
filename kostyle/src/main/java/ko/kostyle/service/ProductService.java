package ko.kostyle.service;

import java.util.List;


import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ProductDTO;
import ko.kostyle.dto.StockDTO;


public interface ProductService {
	
	public List<ProductDTO> productList(Criteria cri);
	
	public void register(ProductDTO proDTO);
	
	public int modify(ProductDTO proDTO);
	
	public int remvove(Long pno);
	
	public ProductDTO get(Long pno);
	
	public int getTotal(Criteria cri);
	
	
	

}
