package ko.kostyle.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CoordiCommentVO {
	
	private Long ccno;
	private Long mno;
	private Long cno;
	private String content;
	private Date last_modified_date;
	
	
}
