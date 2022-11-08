package ko.kostyle.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class CartListVO implements Serializable {

	private long cpno; // 장바구니 번호
	private long mno; // 회원 번호
	private long pno; // 상품 번호
	private int amount; // 장바구니 수량
	private String p_size; //상품 사이즈
	

	private String name; // 옷 이름
	private int price; // 가격
	private int point; // 포인트
		
	private int totalPoint; // 총 포인트
	private int totalPrice; // 총 가격

	private int finalTotalPoint;
	private int finalTotalPrice;
	
	public void initTotal() {
		this.totalPrice = this.price * this.amount;
		this.point = (int) (Math.floor(this.price * 0.05));
		this.totalPoint = this.point * this.amount;
		this.finalTotalPoint += totalPoint;
		this.finalTotalPrice += totalPrice;
	}

}