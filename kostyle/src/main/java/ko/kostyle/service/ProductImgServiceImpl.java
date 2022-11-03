package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ko.kostyle.domain.Product_ImgVO;
import ko.kostyle.dto.Product_ImgDTO;
import ko.kostyle.mapper.ProductImgMapper;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProductImgServiceImpl implements ProductImgService {
	
	@Autowired
	ProductImgMapper imgMapper;

	@Override
	public List<Product_ImgDTO> imgList(Long pno) {
		
		List<Product_ImgVO> imgVO = imgMapper.getImgList(pno);
		List<Product_ImgDTO> imgDTO = new ArrayList<Product_ImgDTO>();
		
		for(Product_ImgVO vo : imgVO) {
			Product_ImgDTO dto = Product_ImgDTO.builder()
			.pno(vo.getPno())
			.fileName(vo.getFileName())
			.filePath(vo.getFilePath())
			.uuid(vo.getUuid())
			.build();
			
			imgDTO.add(dto);
		}
		
		return  imgDTO;
	}

}
