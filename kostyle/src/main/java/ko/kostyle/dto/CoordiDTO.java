package ko.kostyle.dto;

import java.util.Date;

import ko.kostyle.domain.CoordiVO;
import lombok.AllArgsConstructor;
import lombok.Builder;
//import ko.kostyle.util.SecurityUtil;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Getter
@ToString
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Log4j
@Builder
public class CoordiDTO {
	
	private Long cno;
	private	String email;
	private String title;
	private String content;
	private int c_count;
	private int hitcount;
	private int lk_count;
	private String filepath;
	private String filename;
	private String uuid;
	private Date created_date;
	private boolean isLike;
	
	
	
	

}


