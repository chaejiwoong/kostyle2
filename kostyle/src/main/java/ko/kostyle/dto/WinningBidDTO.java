package ko.kostyle.dto;

import java.util.Date;
import java.util.List;

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
public class WinningBidDTO {

	private Long wbno;	//낙찰번호
	private String name;	// 경매상품명
	private int price;	// 낙찰가격
	private ImgDTO img;	// 이미지
}
