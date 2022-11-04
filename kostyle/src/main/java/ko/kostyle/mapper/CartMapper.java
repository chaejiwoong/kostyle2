package ko.kostyle.mapper;

import java.util.List;
import java.util.Map;

import ko.kostyle.domain.CartListVO;

public interface CartMapper {
//	// 카트 추가
//	public int addCart(CartListVO cart) throws Exception;
//
//	// 카트 확인
//	public CartListVO checkCart(CartListVO cart);
//
//	// 카트 수량 수정
//	public int modifyCount(CartListVO cart);
//
//	// 카트 리스트
//	public List<CartListVO> cartList(Long mno) throws Exception;
//
//	// 카트 삭제
//	public int deleteCart(Long cpno);

	
	int selectCartByPnum(CartListVO cartVo);

	int updateCart(CartListVO cartVo);

	int addCart(CartListVO cartVo);

	List<CartListVO> getCart(Long mno);

	int delCart(Long cpno);

	int editCart(CartListVO cartVo);

	void delCartByOrder(Map<String, Long> map);
}
