package ko.kostyle.dto;

import java.util.Date;
import java.util.List;

import ko.kostyle.dto.AuctionDTO.AuctionDTOBuilder;
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
public class ReviewDTO {

	private Long rno;
	private Long mno;
	private Long odno;
	private Long pno;
	private int starPoint;
	private String content;
	private Date last_modified_date;
}
