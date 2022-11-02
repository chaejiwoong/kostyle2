package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.QuestionDTO;

public interface QuestionMapper {
	public List<QuestionVO> getQuestionListWithPaging(Criteria criteria);
	public int questionTotalCount(Criteria criteria);
	public void insertQuestion (QuestionVO questionVO);
	public Integer insertQuestionKey (QuestionVO questionVO);
//	public QuestionDTO getjoin ();
}
