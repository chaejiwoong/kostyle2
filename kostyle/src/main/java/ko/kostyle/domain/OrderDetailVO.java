package ko.kostyle.domain;

import java.io.Serializable;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class OrderDetailVO implements Serializable{

    private Long odno;
    private Long ono;
    private Long pno;
    private String p_size;
    private int amount;
    private int price;

}
