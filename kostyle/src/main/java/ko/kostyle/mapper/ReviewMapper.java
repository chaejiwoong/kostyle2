package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.ProductImgVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.ReviewVO;

public interface ReviewMapper {

	void insertReview(ReviewVO vo);
	
	//리뷰 안남긴 리스트
	List<OrderDetailVO> unwrittenReviewList(Long mno);
	
	//리뷰 남긴 리스트
	List<OrderDetailVO> writeReviewList(Long mno);
	
	ReviewVO reviewDetail(@Param("odno") Long odno, @Param("mno") Long mno);
	
}
