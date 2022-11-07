package ko.kostyle.dto;

import java.util.List;

import ko.kostyle.dto.OrderPayDTO.OrderPayDTOBuilder;
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
public class OrderRequestDTO {
	
	private Long ano;	// 배송지번호
	private String pay; // 결제수단
	private int point;	// 할인포인트
	private List<OrderDetailDTO> orderDetails;	// 주문상품리스트
	private CardDTO card;	// 신용카드 결제정보
	private int accumulate; //적립 포인트

}
