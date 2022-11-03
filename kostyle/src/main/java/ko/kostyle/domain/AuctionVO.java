package ko.kostyle.domain;

import java.io.Serializable;
import java.sql.Date;

import ko.kostyle.domain.OrderCancelVO.OrderCancelVOBuilder;
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
public class AuctionVO implements Serializable{
	private Long apno;
	private String name;
	private int start_price;
	private int best_bid_price;
	private int bid_unit;
	private Date start_date;
	private Date end_date;
}
