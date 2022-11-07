package ko.kostyle.domain;

import java.io.Serializable;
import java.util.Date;

import ko.kostyle.domain.BidVO.BidVOBuilder;
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
public class ReviewVO implements Serializable{

	private Long rno;
	private Long mno;
	private Long pno;
	private Long odno;
	private int starPoint;
	private String content;
	private Date last_modified_date;
	
	
}
