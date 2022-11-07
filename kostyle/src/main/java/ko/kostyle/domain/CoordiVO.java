package ko.kostyle.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CoordiVO {

	private Long cno;
	private Long mno;
	private String title;
	private String content;
	private int c_count;
	private int hitcount;
	private int lk_count;
	private String filepath;
	private String filename;
	private String uuid;
	private Date created_date;
	
	
}
