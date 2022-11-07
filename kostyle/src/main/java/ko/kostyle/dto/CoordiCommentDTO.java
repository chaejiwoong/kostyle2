package ko.kostyle.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CoordiCommentDTO {

	private Long ccno;
	private String email;
	private Long cno;
	private String content;
	private Date date;
	
	@Builder
	public CoordiCommentDTO(Long ccno, String email, Long cno, String content, Date date) {
		super();
		this.ccno = ccno;
		this.email = email;
		this.cno = cno;
		this.content = content;
		this.date = date;
	}


	
}
