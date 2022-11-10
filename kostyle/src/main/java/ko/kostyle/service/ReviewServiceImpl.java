package ko.kostyle.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.ProductImgVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.ReviewVO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.AdminProductDTO;
import ko.kostyle.dto.ImgDTO;
import ko.kostyle.dto.ReviewDTO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.ProductImgMapper;
import ko.kostyle.mapper.ReviewMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class ReviewServiceImpl implements ReviewService{
	
	private final ReviewMapper reviewMapper;
	private final AdminOrderMapper orderMapper;
	private final ProductImgMapper imgMapper;
	
	// 리뷰 등록
	@Override
	public void insertReview(ReviewDTO dto) {
		
		log.info("insertReview service........");
		ReviewVO vo = ReviewVO.builder()
				.mno(dto.getMno())
				.pno(dto.getPno())
				.content(dto.getContent())
				.odno(dto.getOdno())
				.starPoint(dto.getStarPoint())
				.build();
		
		reviewMapper.insertReview(vo);
		
	}
	
	

	// 리뷰를 남기지 않은 주문상세 조회
	@Override
	public List<AdminOrderDetailDTO> unwrittenReviewList() {
		
		// 리뷰를 남기지 않은 주문상세 조회
		log.info("unwrittenReviewList service........");
		return reviewMapper.unwrittenReviewList(SecurityUtil.getCurrentMemberId())
				.stream().map(vo -> toDto(vo))
				.collect(Collectors.toList());

	}

	// 리뷰 남긴 리스트 조회
	@Override
	public List<AdminOrderDetailDTO> writeReviewList() {
		log.info("writeReviewService service........");
		return reviewMapper.writeReviewList(SecurityUtil.getCurrentMemberId())
				.stream().map(vo -> toDto(vo))
				.collect(Collectors.toList());
	}
	
	// 리뷰 등록페이지 주문상세 조회
	public AdminOrderDetailDTO orderDetails(Long odno) {
		return toDto(orderMapper.getOrderDetail(odno));
	}
	
	// dto변환 메서드
	private AdminOrderDetailDTO toDto(OrderDetailVO orderDetail){
        
        	AdminOrderDetailDTO dto = new AdminOrderDetailDTO();
        	
        	// 주문상세의 상품 조회
        	ProductVO product = orderMapper.productDetail(orderDetail.getOdno());

        	// 상품 DTO로 변환
        	AdminProductDTO productDto = AdminProductDTO.builder()
        									.pno(product.getPno())
        									.name(product.getName())
        									.build();
        	
        	// 해당 상품의 이미지 조회 후 DTO로 변환
        	ProductImgVO img = imgMapper.selectImg(product.getPno());
        	ImgDTO imgDto = null;
        	if(img != null) {
    			imgDto = ImgDTO.builder()
						.filename(img.getFilename())
						.filepath(img.getFilepath())
						.uuid(img.getUuid()).build();
        	}
        	
        	productDto.setImg(imgDto);
        	
        	//최종적으로 주문상세 DTO로 변환
        	dto.setOdno(orderDetail.getOdno());
        	dto.setOno(orderDetail.getOno());
        	dto.setProduct(productDto);
        	dto.setAmount(orderDetail.getAmount());
        	dto.setPrice(orderDetail.getPrice());
        	dto.setP_size(orderDetail.getP_size());
        	
        
        return dto; 
	}


	//리뷰 조회
	@Override
	public ReviewDTO reviewDetail(Long odno) {
		
		return toDto(reviewMapper.reviewDetail(odno, SecurityUtil.getCurrentMemberId()));
	}
	
	private ReviewDTO toDto(ReviewVO vo) {
		return ReviewDTO.builder()
				.rno(vo.getRno())
				.mno(vo.getMno())
				.odno(vo.getOdno())
				.pno(vo.getPno())
				.starPoint(vo.getStarPoint())
				.content(vo.getContent())
				.last_modified_date(vo.getLast_modified_date())
				.build();
	}
}
