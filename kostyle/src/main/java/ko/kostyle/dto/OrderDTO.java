package ko.kostyle.dto;

import lombok.*;
import ko.kostyle.dto.members.MemberDTO;

import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class OrderDTO {

    private Long ono;
    private AddressDTO address;
    private MemberDTO member;
    
    // 주문 목록의 대표 이름
    private String name;
    
    private String payment;
    private String category;
    private int totalPrice;
    private String status;
    private Date created_date;
    private OrderDetailDTO orderDetail;
    private WinningBidDTO winningBid;
}
