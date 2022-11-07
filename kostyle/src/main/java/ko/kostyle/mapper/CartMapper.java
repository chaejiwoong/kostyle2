package ko.kostyle.mapper;

import java.util.List;
import java.util.Map;

import ko.kostyle.domain.CartListVO;

public interface CartMapper {
	
	int selectCartByPnum(CartListVO cartVo);

	int updateCart(CartListVO cartVo);

	int addCart(CartListVO cartVo);

	List<CartListVO> getCart(Long mno);

	int delCart(Long cpno);

	int editCart(CartListVO cartVo);

	void delCartByOrder(Map<String, Long> map);
	
}
