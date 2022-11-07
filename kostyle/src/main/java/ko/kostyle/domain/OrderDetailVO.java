package ko.kostyle.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class OrderDetailVO implements Serializable{

    private Long odno; //주문 상세 번호
    private Long ono; //주문 번호
    private Long pno; //상품 번호
    private String p_size;
    private int amount; //주문 수량
    private int price; //주문 가격
    
    private String payment;
    private Date created_date;
    
    private Long ano; // 배송지 번호
	private Long mno; // 회원 번호
	private String address; // 주소
	private String tel; // 전화 번호
	private String name; // 이름
	private boolean is_default; // 기본 배송지 여부
}
