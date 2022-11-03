package ko.kostyle.service;

import java.util.List;


import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ProductDTO;
import ko.kostyle.dto.StockDTO;


public interface ProductService {
	
	public List<ProductDTO> productList(Criteria cri); //상품목록
	
	public void register(ProductDTO proDTO);//상품등록
	
	public int modify(ProductDTO proDTO);//상품수정
	
	public int remvove(Long pno);//상품삭제
	
	public ProductDTO get(Long pno);
	
	public int getTotal(Criteria cri);
	

	
	
	

}
