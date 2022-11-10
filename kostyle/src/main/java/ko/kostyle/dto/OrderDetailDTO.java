package ko.kostyle.dto;


import ko.kostyle.domain.OrderDetailVO;
import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
@ToString
public class OrderDetailDTO {

    private Long odno;
    private Long pno;
    private Long ono;
    
    private AdminProductDTO product;

    private String p_size;
    private int amount;
    private int price;
    
    // 주문 상태
    private String status;

    
    public static OrderDetailVO toVO(OrderDetailDTO dto) {
    	
    	return OrderDetailVO.builder()
    			.ono(dto.getOno())
    			.pno(dto.getPno())
    			.p_size(dto.getP_size())
    			.amount(dto.getAmount())
    			.price(dto.getPrice())
    			.build();
    }
}