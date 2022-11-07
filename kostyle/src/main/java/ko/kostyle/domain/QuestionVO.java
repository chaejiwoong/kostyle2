package ko.kostyle.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QuestionVO extends MemberVO{
	private Long qno;
//	private List<MemberVO> mno;
	private Long mno;
	private String title;
	private String content;
	private Date created_date;
	
	private MemberVO memberVO;
}
