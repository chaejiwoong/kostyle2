package ko.kostyle.service;

import java.util.List;

import ko.kostyle.domain.AnswerVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.QuestionDTO;

public interface QuestionService {
	
	public List<QuestionVO> getList(Criteria criteria);
	public int questionTotal(Criteria criteria);
	
	public void insert(QuestionVO vo);
//	문의
	public QuestionVO showQuestion(Long qno);
	
	public int register(AnswerVO answerVO, Long qno, String content);
	public AnswerVO get(Long qno);
	public int modify(AnswerVO answerVO);
	public int remove(Long asno);
	public List<AnswerVO> getList(Criteria criteria, Long qno);

}
