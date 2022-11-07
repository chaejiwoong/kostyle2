package ko.kostyle.domain;

import java.sql.Date;

import ko.kostyle.domain.AttentionAuctionVO.AttentionAuctionVOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class AnswerVO {
	private Long asno;
	private Long qno;
	private String content;
	private Date created_date;
	
	private QuestionVO questionVO;
	
}
