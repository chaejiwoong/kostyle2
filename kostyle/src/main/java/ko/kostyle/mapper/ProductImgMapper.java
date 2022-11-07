package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.ProductImgVO;
import ko.kostyle.domain.Product_ImgVO;

public interface ProductImgMapper {
	
	public List<Product_ImgVO> getImgList(Long pno);
	
	//임시 상품 사진 조회
	ProductImgVO selectImg(Long pno);
}
