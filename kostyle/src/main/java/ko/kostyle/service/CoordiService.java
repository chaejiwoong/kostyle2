package ko.kostyle.service;

import java.util.List;

import ko.kostyle.domain.CoordiVO;
import ko.kostyle.dto.CoordiDTO;
import ko.kostyle.dto.Criteria;

public interface CoordiService {
	
	public List<CoordiDTO> getList(Criteria cri);
	public CoordiDTO getCoordi(Long cno);
	public void update(CoordiDTO coordiDTO);
	public void delete(Long cno);
	public void register(CoordiDTO CoordiDTO);
	public void updateCommentCount(Long cno, int amount);
	public void updateHitcount(Long cno);
	public void updateLikeCount(Long cno);
	public int getTotalCount(Criteria cri); 
	
	public List<CoordiDTO> myPage(Long mno);
	
	
	
	

}
