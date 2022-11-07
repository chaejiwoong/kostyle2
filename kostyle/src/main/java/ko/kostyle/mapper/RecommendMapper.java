package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.domain.ProductVO;

public interface RecommendMapper {
	// 장바구니 상품 추천
	List<ProductVO> cartRecommendProduct(ProductVO vo);
	
	// 장바구니 추천 상품 이미지
	AuctionImgVO cartRecommendImg(Long pno);
	
	//임시 상품 조회
	ProductVO getProduct(Long pno);
}
