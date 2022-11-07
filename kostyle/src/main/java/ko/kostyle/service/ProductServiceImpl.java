package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.Product_ImgVO;
import ko.kostyle.domain.StockVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ProductDTO;
import ko.kostyle.dto.Product_ImgDTO;
import ko.kostyle.dto.StockDTO;
import ko.kostyle.mapper.ProductImgMapper;
import ko.kostyle.mapper.ProductMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	
	@Autowired
	private ProductMapper proMapper;
	
	@Autowired
	private ProductImgMapper imgMapper;

	@Override
	public List<ProductDTO> productList(Criteria cri) {
		List<ProductVO> proVO = proMapper.getListWithPaging(cri);
		List<ProductDTO> proDTO =new ArrayList<ProductDTO>();
		
		for(ProductVO prolist : proVO) {
			
			ProductDTO dto = new ProductDTO();
			
			dto.setPno(prolist.getPno());
			dto.setName(prolist.getName());
			dto.setColor(prolist.getColor());
			dto.setGender(prolist.getGender());
			dto.setHitCount(prolist.getHitCount());
			dto.setPrice(prolist.getPrice());
			dto.setSeason(prolist.getSeason());
			dto.setCreated_date(prolist.getCreated_date());
			dto.setLast_modified_date(prolist.getLast_modified_date());
			
			List<Product_ImgVO> imgList =imgMapper.getImgList(prolist.getPno());
			dto.setImageList(imgList);

			
			proDTO.add(dto);
		
		}
		
		return proDTO;
	}

	@Transactional
	@Override
	public void register(ProductDTO proDTO) {
		log.info("dto : " + proDTO);
		ProductVO proVO = new ProductVO();
		
		proVO.setPno(proDTO.getPno());
		proVO.setName(proDTO.getName());
		proVO.setPrice(proDTO.getPrice());
		proVO.setColor(proDTO.getColor());
		proVO.setGender(proDTO.getGender());
		proVO.setSeason(proDTO.getSeason());
		proVO.setScno(proDTO.getScno());
		
		
		
		proMapper.productInsert(proVO);
		

		List<StockVO> list = proDTO.getStockList();
		for(StockVO vo : list) {
			vo.setPno(proVO.getPno());
			proMapper.stockInsert(vo);
		}
		

	List<Product_ImgVO> imgList = proDTO.getImageList();
	

	proDTO.getImageList().forEach(img ->{
			
			img.setPno(proVO.getPno());
			proMapper.imgInsert(img);	
			
		});
		
		
	}


	@Override
	@Transactional
	public int modify(ProductDTO proDTO) {
		ProductVO proVO = new ProductVO();
		
		
	proMapper.imageDelete(proDTO.getPno());
	
		
		
		proVO.setPno(proDTO.getPno());
		proVO.setName(proDTO.getName());
		proVO.setPrice(proDTO.getPrice());
		proVO.setColor(proDTO.getColor());
		proVO.setGender(proDTO.getGender());
		proVO.setSeason(proDTO.getSeason());
		proVO.setLast_modified_date(proDTO.getLast_modified_date());
		
		List<StockVO> list = proDTO.getStockList();
		for(StockVO vo : list) {
			vo.setPno(proVO.getPno());
			proMapper.stockUpdate(vo);
		}
		
		List<Product_ImgVO> imgList = proDTO.getImageList();
		
		

		proDTO.getImageList().forEach(img ->{
				
				img.setPno(proVO.getPno());
				proMapper.imgInsert(img);	
			});
		return proMapper.productUpdate(proVO);
	}


	@Override
	public int remvove(Long pno) {
		
		return proMapper.productDelete(pno);
	}


	@Override
	public ProductDTO get(Long pno) {
		
		ProductVO vo = proMapper.productGet(pno);
		ProductDTO dto = new ProductDTO();
		
		dto.setPno(vo.getPno());
		dto.setName(vo.getName());
		dto.setColor(vo.getColor());
		dto.setGender(vo.getGender());
		dto.setHitCount(vo.getHitCount());
		dto.setPrice(vo.getPrice());
		dto.setSeason(vo.getSeason());
		dto.setCreated_date(vo.getCreated_date());
		dto.setLast_modified_date(vo.getLast_modified_date());
		
		
		List<StockVO> list = proMapper.stockList(pno);
		dto.setStockList(list);
		
		
		
		return dto;
	}


	@Override
	public int getTotal(Criteria cri) {
		return proMapper.productGetTotal(cri);
		
	}
	//조회수 증가
	   @Override
	   public void updateHitcount(Long pno) {
	      proMapper.updateHitcount(pno);
	   }

	  //조회수에 따른 상품 출력
	   @Override
		public List<ProductDTO> productListHit() {
			List<ProductVO> proVO = imgMapper.productGetHit();
			List<ProductDTO> proDTO =new ArrayList<ProductDTO>();
			
			for(ProductVO prolist : proVO) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPno(prolist.getPno());
				dto.setName(prolist.getName());
				dto.setColor(prolist.getColor());
				dto.setGender(prolist.getGender());
				dto.setHitCount(prolist.getHitCount());
				dto.setPrice(prolist.getPrice());
				dto.setSeason(prolist.getSeason());
				dto.setCreated_date(prolist.getCreated_date());
				
				
				
				List<Product_ImgVO> imgList =imgMapper.getImgList(prolist.getPno());
				log.info("이게 이미지 리스트 인가" + imgList);
				dto.setImageList(imgList);
				
				
				
				proDTO.add(dto);
			
			}
			
			return proDTO;
		}   
	   
	   
	 //신상에 따른 상품 출력
	   @Override
		public List<ProductDTO> productListDay() {
			List<ProductVO> proVO = imgMapper.productGetDay();
			List<ProductDTO> proDTO =new ArrayList<ProductDTO>();
			
			for(ProductVO prolist : proVO) {
				
				ProductDTO dto = new ProductDTO();
				
				dto.setPno(prolist.getPno());
				dto.setName(prolist.getName());
				dto.setColor(prolist.getColor());
				dto.setGender(prolist.getGender());
				dto.setHitCount(prolist.getHitCount());
				dto.setPrice(prolist.getPrice());
				dto.setSeason(prolist.getSeason());
				dto.setCreated_date(prolist.getCreated_date());
				log.info("이건 찍히는가.....");
				
				
				List<Product_ImgVO> imgList =imgMapper.getImgList(prolist.getPno());
				
				dto.setImageList(imgList);
				
				
				
				proDTO.add(dto);
			
			}
			
			return proDTO;
		}   


//	   private ProductDTO toDto(ProductVO vo) {
//		   ProductDTO dto = new ProductDTO();
//			
//			dto.setPno(vo.getPno());
//			dto.setName(vo.getName());
//			dto.setColor(vo.getColor());
//			dto.setGender(vo.getGender());
//			dto.setHitCount(vo.getHitCount());
//			dto.setPrice(vo.getPrice());
//			dto.setSeason(vo.getSeason());
//			dto.setCreated_date(vo.getCreated_date());
//			dto.setLast_modified_date(vo.getLast_modified_date());
//			
//			
//			List<StockVO> list = proMapper.stockList(vo.getPno());
//			dto.setStockList(list);
//			
//			return dto;
//			
//			   return imgMapper.productGetHit().stream()
//				   		.map(vo -> toDto(vo))
//				   		.collect(Collectors.toList());
//	   }




	


}
