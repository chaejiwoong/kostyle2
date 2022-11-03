package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.dto.AdminProductDTO;
import ko.kostyle.dto.ImgDTO;
import ko.kostyle.mapper.RecommendMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class RecommendServiceImpl implements RecommendService{
	
	private final RecommendMapper recommendMapper;
	
	// 장바구니 추천상품 서비스
	@Override
	@Transactional(readOnly = true)
	public List<AdminProductDTO> cartRecommendService(Long pno) {
		log.info("장바구니 상품 추천.....");
		log.info("pno : " + pno);
		
		// 상품추천 리스트
		List<ProductVO> recommends = recommendMapper.cartRecommendProduct(recommendMapper.getProduct(pno));
		List<AdminProductDTO> dtos = new ArrayList<AdminProductDTO>();
		for(ProductVO product : recommends) {
			
			AuctionImgVO img = recommendMapper.cartRecommendImg(product.getPno());
			
			AdminProductDTO dto = AdminProductDTO.builder()
				.name(product.getName())
				.price(product.getPrice())
				.pno(product.getPno())
				.img(ImgDTO.of(img))
				.build();
		
			dtos.add(dto);
		}

		return dtos;
	}
	
	

}
