package ko.kostyle.dto;


import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
@ToString
public class AdminOrderDetailDTO {

    private Long odno;
    private Long ono;
    private AdminProductDTO product;
    private String p_size;
    private int amount;
    private int price;

}
