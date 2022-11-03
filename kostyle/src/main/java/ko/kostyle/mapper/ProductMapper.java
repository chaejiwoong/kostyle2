package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.Product_ImgVO;
import ko.kostyle.domain.StockVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ProductDTO;


public interface ProductMapper {
	
	public void productInsert(ProductVO proVO); //상품들록
	public void stockInsert(StockVO stockVO);
	public List<StockVO> stockList(Long pno);
	public void imgInsert(Product_ImgVO imgVO); //이미지 등록
	public void imageDelete(Long pno);
	
	public int productUpdate(ProductVO proVO);
	public int stockUpdate(StockVO stockVO);
	
	public int productDelete(Long pno);
	
	public ProductVO productGet(Long pno);//상품 상세정보
	public List<ProductVO> getListWithPaging(Criteria cri); //페이징 처리
	
	public int productGetTotal(Criteria cri);
	
	
	

	
	

}
