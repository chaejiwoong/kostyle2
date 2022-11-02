package ko.kostyle.service;

import java.util.List;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.QuestionDTO;

public interface QuestionService {
	
	public List<QuestionVO> getList(Criteria criteria);
	public int questionTotal(Criteria criteria);
	
	public void insert(QuestionVO vo);
	
//	public QuestionDTO getname();

}
