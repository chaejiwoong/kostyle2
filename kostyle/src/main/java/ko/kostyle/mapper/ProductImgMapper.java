package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.Product_ImgVO;

public interface ProductImgMapper {
	
	public List<Product_ImgVO> getImgList(Long pno);
	
	public List<ProductVO> productGetHit();

}
