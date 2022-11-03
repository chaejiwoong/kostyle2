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
import ko.kostyle.dto.StockDTO;
import ko.kostyle.mapper.ProductMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductServiceImpl implements ProductService {
	
	
	@Autowired
	private ProductMapper proMapper;

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
			dto.setPrice(prolist.getPrice());
			dto.setSeason(prolist.getSeason());
			dto.setCreated_date(prolist.getCreated_date());
			
			proDTO.add(dto);
			
			
		
		}
		
		return proDTO;
	}

	@Transactional
	@Override
	public void register(ProductDTO proDTO) {
		log.info("dto : " + proDTO);
		ProductVO proVO = new ProductVO();
		
	
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
	log.info("11111111111111111111111111" +imgList);

	proDTO.getImageList().forEach(img ->{
			
			img.setPno(proVO.getPno());
			proMapper.imgInsert(img);	
			log.info("222333333333333333332" +img);
		});
		log.info("222222222222222222222222" +imgList);
		
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
		
		log.info("11111111111111111111111111" +imgList);

		proDTO.getImageList().forEach(img ->{
				
				img.setPno(proVO.getPno());
				proMapper.imgInsert(img);	
				log.info("222333333333333333332" +img);
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








	


}
