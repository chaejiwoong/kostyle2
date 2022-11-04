package ko.kostyle.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import ko.kostyle.domain.CartListVO;
import ko.kostyle.domain.ProductVO;

@Service
public interface CartService {
//	// 장바구니 추가
//	public int addCart(CartListVO cart);	
//	
//	// 장바구니 정보 리스트
//	public List<CartListVO> getCartList(Long mno) throws Exception;		
//	
//	// 카트 삭제 
//	public int deleteCart(Long cpno);
//	
//	// 카트 수량 수정
//	public int modifyCount(CartListVO cart);		

	/** 장바구니 관련 메소드=============== */
	int addCart(CartListVO CartListVO);// 장바구니 추가하기

	int updateCart(CartListVO CartListVO);// 장바구니 추가 관련=>기존에 담긴 상품이면 수량만 수정하기

	int editCart(CartListVO CartListVO);// 장바구니 수정하기

	List<CartListVO> getCartList(Long mno) throws Exception;

	int delCart(Long cpno);

	int delCartAll(CartListVO CartListVO);

	int delCartOrder(Map<String, Long> map);

	int getCartCount(CartListVO CartListVO);

	public void delCartByOrder(Long mno, Long pno);

	ProductVO selectByPno(Long pno);

}
