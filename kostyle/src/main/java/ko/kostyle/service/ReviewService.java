package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.ReviewDTO;

public interface ReviewService {

	void insertReview(ReviewDTO dto);
	
	List<AdminOrderDetailDTO> unwrittenReviewList();
	
	List<AdminOrderDetailDTO> writeReviewList();
	
	AdminOrderDetailDTO orderDetails(Long odno);
	
	ReviewDTO reviewDetail(Long odno);
}
