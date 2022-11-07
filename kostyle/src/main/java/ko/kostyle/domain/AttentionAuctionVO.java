package ko.kostyle.domain;

import java.io.Serializable;
import java.util.Date;

import ko.kostyle.domain.DeliveryVO.DeliveryVOBuilder;
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
public class AttentionAuctionVO implements Serializable{

	private Long aano;
	private Long mno;
	private Long apno;
}
