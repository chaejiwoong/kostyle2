package ko.kostyle.service;

import java.util.List;

import org.springframework.stereotype.Service;


import ko.kostyle.dto.Product_ImgDTO;

@Service
public interface ProductImgService {
	
	public List<Product_ImgDTO> imgList(Long pno); //이미지 상세페이지에 호출
	

}
