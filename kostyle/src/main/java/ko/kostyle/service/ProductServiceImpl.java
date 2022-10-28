package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ko.kostyle.domain.ProductVO;
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

	
	@Override
	public void register(ProductDTO proDTO) {
		
		ProductVO proVO = new ProductVO();
		
		proVO.setName(proDTO.getName());
		proVO.setPrice(proDTO.getPrice());
		proVO.setColor(proDTO.getColor());
		proVO.setHitCount(proDTO.getHitCount());
		proVO.setGender(proDTO.getGender());
		proVO.setSeason(proDTO.getSeason());

		
//		List<StockDTO> stocks = proDTO.getStockList();
//		for(StockDTO stock : stocks) {
//			StockVO vo = new StockVO();
//			vo.setPno(proVO.getPno());
//			vo.setP_size(stock.getP_size());
//			vo.setAmount(stock.getAmount());		
//		}
		
		
		

		
	}


	@Override
	public int modify(ProductDTO proDTO) {
		ProductVO proVO = new ProductVO();
		
		proVO.setName(proDTO.getName());
		proVO.setPrice(proDTO.getPrice());
		proVO.setColor(proDTO.getColor());
		proVO.setGender(proDTO.getGender());
		proVO.setSeason(proDTO.getSeason());
		
		return proMapper.productUpdate(proVO);
	}


	@Override
	public int remvove(Long pno) {
		
		return proMapper.productDelete(pno);
	}


	@Override
	public ProductDTO get(Long pno) {
		
		ProductVO vo = proMapper.get(pno);
		ProductDTO dto = new ProductDTO();
		
		dto.setName(vo.getName());
		dto.setColor(vo.getColor());
		dto.setGender(vo.getGender());
		dto.setPrice(vo.getPrice());
		dto.setSeason(vo.getSeason());
		
		return dto;
	}


	@Override
	public int getTotal(Criteria cri) {
		return proMapper.productGetTotal(cri);
		
	}








	
	

}
