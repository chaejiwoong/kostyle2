package ko.kostyle.dto;


import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
@ToString
public class OrderDetailDTO {

    private Long odno;
    
    private Long ono;
    
    private AdminProductDTO product;
    
    private String p_size;
    private int amount;
    private int price;
    
    // 주문 상태
    private String status;

}