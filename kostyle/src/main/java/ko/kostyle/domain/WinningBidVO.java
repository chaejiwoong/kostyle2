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
public class WinningBidVO implements Serializable{

	private Long wbno;
	private Long bno;
	private Long ono;
}
