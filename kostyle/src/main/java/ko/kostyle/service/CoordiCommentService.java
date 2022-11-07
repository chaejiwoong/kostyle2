package ko.kostyle.service;

import java.util.List;

import ko.kostyle.domain.CoordiCommentVO;
import ko.kostyle.dto.CommentPageDTO;
import ko.kostyle.dto.CoordiCommentDTO;
import ko.kostyle.dto.Criteria;

public interface CoordiCommentService {
	
	//public List<CoordiCommentDTO> getList(Criteria cri, Long cno); //디티오 타입으로 변환
	public int register(CoordiCommentDTO commentDTO);
	public CoordiCommentDTO getComment(Long ccno); //디티오 타입으로 변환
	public int remove(Long ccno);	
	public CommentPageDTO getListPage(Criteria cri, Long cno);
	
	
}
