package ko.kostyle.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import ko.kostyle.dto.BidDTO.BidDTOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@ToString
@Builder
public class AnswerDTO {
	private Long asno;
	private Long qno;
	private String content;
	private Date created_date;
	
	/*
	 * // private QuestionDTO questionDTO; public ArrayList<QuestionDTO>
	 * checkAnswer(Long qno) { ArrayList<QuestionDTO> list = new
	 * ArrayList<QuestionDTO>(); try {
	 * 
	 * for (int i = 0; i < list.size(); i++) { var a = list.get(i).getContent();
	 * System.out.println("답변" + a); } } catch (Exception e) { // TODO: handle
	 * exception }
	 * 
	 * return list; }
	 */
}