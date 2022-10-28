package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.StockVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ProductDTO;


public interface ProductMapper {
	
	public void productInsert(ProductVO proVO);
	/* public List<StockVO> stockInsert(StockVO sVO); */
	
	
	public int productUpdate(ProductVO proVO);
	
	public int productDelete(Long pno);
	
	public ProductVO get(Long pno);
	
	public List<ProductVO> getListWithPaging(Criteria cri); //페이징 처리
	
	public int productGetTotal(Criteria cri);

}
