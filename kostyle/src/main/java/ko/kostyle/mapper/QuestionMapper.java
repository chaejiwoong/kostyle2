package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.AnswerVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.QuestionDTO;

public interface QuestionMapper {
	public List<QuestionVO> getQuestionListWithPaging(Criteria criteria);
	public int questionTotalCount(Criteria criteria);
	public void insertQuestion (QuestionVO questionVO);
	public Integer insertQuestionKey (QuestionVO questionVO);
	
//	문의
	public QuestionVO insertInquiry(Long qno);
	
//	문의 댓글
	public int insertAnswer(@Param("answerVO")AnswerVO answerVO, @Param("qno") Long qno, @Param("content") String content);
	public AnswerVO readAnswer(Long qno);
	public int deleteAnswer(Long asno);
	public int updateAnswer(AnswerVO answerVO);
	public List<AnswerVO> getListWithPaging(@Param("cri") Criteria cri, @Param("qno") Long qno);
}
