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
@Builder
public class OrderVO implements Serializable {

    private Long ono;
    private Long ano;
    private Long mno;
    private String payment;
    private int totalPrice;
    private String category;
    private String status;
    private Date created_date;

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
