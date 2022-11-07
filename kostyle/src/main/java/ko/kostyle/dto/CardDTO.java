package ko.kostyle.dto;

import java.util.List;

import ko.kostyle.dto.OrderRequestDTO.OrderRequestDTOBuilder;
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
@Builder
@ToString
public class CardDTO {

	private String category;// 카드 종류
	
	private int month;		//할부 개월 수
	
	private String cardNum;	//카드번호
}
