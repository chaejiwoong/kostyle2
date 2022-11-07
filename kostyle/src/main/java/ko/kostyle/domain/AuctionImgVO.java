package ko.kostyle.domain;

import java.sql.Date;

import ko.kostyle.domain.AuctionVO.AuctionVOBuilder;
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
public class AuctionImgVO {
	
	private Long apno;
	private Long aino;
	private String filepath;
	private String filename;
	private String uuid;
}
