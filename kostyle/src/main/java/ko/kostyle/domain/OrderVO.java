package ko.kostyle.domain;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class OrderVO implements Serializable {

    private Long ono;
    private Long ano;
    private Long mno;
    private String payment;
    private int totalPrice;
    private String status;
    private Date created_date;

    public OrderVO(Long mno, String payment, int totalPrice, String status, Date created_date) {
        this.mno = mno;
        this.payment = payment;
        this.totalPrice = totalPrice;
        this.status = status;
        this.created_date = created_date;
    }
}
