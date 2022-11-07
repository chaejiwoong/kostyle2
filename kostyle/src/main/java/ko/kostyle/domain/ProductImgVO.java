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
public class ProductImgVO {
	
	private Long pno;
	private Long pino;
	private String filepath;
	private String filename;
	private String uuid;
}
