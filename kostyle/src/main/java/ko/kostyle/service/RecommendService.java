package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AdminProductDTO;

public interface RecommendService {

	public List<AdminProductDTO> cartRecommendService(Long pno);
}
