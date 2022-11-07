package ko.kostyle.dto;

import lombok.*;
import ko.kostyle.dto.members.MemberDTO;

import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class AdminOrderDTO {

    private Long ono;
    private AddressDTO address;
    private MemberDTO member;
    private String payment;
    private String category;
    private int totalPrice;
    private String status;
    private Date created_date;
}
