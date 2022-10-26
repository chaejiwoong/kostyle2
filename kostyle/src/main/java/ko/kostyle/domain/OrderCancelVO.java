package ko.kostyle.domain;

import java.io.Serializable;
import java.sql.Date;

import ko.kostyle.domain.OrderDetailVO.OrderDetailVOBuilder;
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
public class OrderCancelVO implements Serializable{
	
	private Long ocno;
	private Long odno;
	private String category;
	private String reason;
	private Date created_date;

}
