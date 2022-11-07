package ko.kostyle.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ko.kostyle.domain.AnswerVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.QuestionDTO;
import ko.kostyle.mapper.QuestionMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QuestionServiceImpl implements QuestionService{
	
	@Autowired
	private QuestionMapper mapper;
	
	@Autowired
	private HttpSession session;

	@Override
	public List<QuestionVO> getList(Criteria criteria) {
		
		return mapper.getQuestionListWithPaging(criteria);
	}

	@Override
	public int questionTotal(Criteria criteria) {
		return mapper.questionTotalCount(criteria);
	}

	@Override
	public void insert(QuestionVO vo) {
		((MemberVO)session.getAttribute("user")).getName();
		mapper.insertQuestionKey(vo);
		
	}

	@Override
	public int register(AnswerVO answerVO, Long qno, String content) {
		
		return mapper.insertAnswer(answerVO, qno, content);
	}

	@Override
	public AnswerVO get(Long qno) {
		return mapper.readAnswer(qno);
	}

	@Override
	public int modify(AnswerVO answerVO) {
		
		return mapper.updateAnswer(answerVO);
	}

	@Override
	public int remove(Long asno) {
		return mapper.deleteAnswer(asno);
	}

	@Override
	public List<AnswerVO> getList(Criteria criteria, Long qno) {
		return mapper.getListWithPaging(criteria, qno);
	}

	@Override
	public QuestionVO showQuestion(Long qno) {
		return mapper.insertInquiry(qno);
		
	}


	

	




}
