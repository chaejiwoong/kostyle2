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
public class StockVO implements Serializable{

	private Long sno;
	private Long pno;
	private String p_size;
	private int amount;
}
