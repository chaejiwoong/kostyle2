package ko.kostyle.dto;

import java.io.Serializable;
import java.sql.Date;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.AddressDTO.AddressDTOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class QuestionDTO implements Serializable{
	private Long qno;
//	private List<MemberVO> mno;
	private Long mno;
	private String name;
	private String title;
	private String content;
	private Date created_date;
	
	private MemberDTO memberDTO;
}
