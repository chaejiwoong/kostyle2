package ko.kostyle.domain;

import lombok.*;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class OrderVO implements Serializable {

	private Long ono; // 주문 번호
	private Long ano; // 배송지 번호
	private Long mno; // 회원 번호
	private String payment; // 결제 방식
	private int totalPrice; // 주문 가격
	private String status; // 배송 상태
	private Date created_date; // 주문 일자

	private int amount;
	private int point;
	private int totalPoint;
	private int price;
	private Long cpno;

	private AddressVO address;
	private CartListVO cart;
	

	// product
	private String name;
	private List<CartListVO> orderList;// 주문상품 목록

	public OrderVO(Long ono, Long mno, String payment, int totalPrice, String status, Date created_date) {
		this.ono = ono;
		this.mno = mno;
		this.payment = payment;
		this.totalPrice = totalPrice;
		this.status = status;
		this.created_date = created_date;
	}

	public void initSaleTotal() {
		this.totalPrice = this.price * this.amount;
		this.point = (int) (Math.floor(this.price * 0.05));
		this.totalPoint = this.point * this.amount;

	}

}
