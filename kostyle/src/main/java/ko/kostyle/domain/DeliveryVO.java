package ko.kostyle.domain;

import java.io.Serializable;
import java.util.Date;

import ko.kostyle.domain.MemberVO.MemberVOBuilder;
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
public class DeliveryVO implements Serializable{
	
	private Long dno;
	private Long ono;
	private Date start_date;
	private Date end_date;
}
