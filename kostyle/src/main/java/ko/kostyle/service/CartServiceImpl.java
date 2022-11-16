package ko.kostyle.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ko.kostyle.domain.CartListVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.ProductImgVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.domain.Product_ImgVO;
import ko.kostyle.mapper.CartMapper;
import ko.kostyle.mapper.ProductImgMapper;
import ko.kostyle.mapper.ProductMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;

	@Autowired
	private ProductImgMapper imgMapper;
	
	@Autowired
	private ProductMapper productMapper;

	@Override
	public int addCart(CartListVO CartListVO) {
		// [1] 상품번호와 회원번호로 cart 테이블에 있는 상품개수 가져오기
		int count = cartMapper.selectCartByPnum(CartListVO);
		System.out.println("count= " + count);

		int n = 0;
		/*
		 * if (count > 0) { // [2] 해당 상품이 이미 장바구니에 있다면 수량만 추가 n =
		 * cartMapper.updateCart(CartListVO); // [3] 해당 상품이 장바구니에 없는 상품이라면 insert } else
		 * {
		 */
			n = cartMapper.addCart(CartListVO);
//		}

		return n;
	}

	@Override
	public int updateCart(CartListVO CartListVO) {
		return 0;
	}

	@Override
	public int editCart(CartListVO CartListVO) {
		// 수량에 따라 다르게 로직 처리!
		int amount = CartListVO.getAmount();
		if (amount == 0) { // 수량이 0이면 삭제처리
			return this.delCart(CartListVO.getCpno());
		} else if (amount < 0) { // 음수
			throw new NumberFormatException("수량이 음수여선 안됩니다!!");
		} else { // 양수일땐 수량 수정 처리
			return this.cartMapper.editCart(CartListVO);
		}
	}

	@Override
	public List<CartListVO> getCartList(Long mno) throws Exception {
		List<CartListVO> cart = cartMapper.getCart(mno);

		
		for (CartListVO vo : cart) {
			Long pno = vo.getPno();

			ProductImgVO img =imgMapper.selectImg(pno);
			String fileName = img.getFilepath() + "/" +img.getUuid() + "_"  +img.getFilename();
			vo.setFileName(fileName);
			vo.initTotal();
		}
		
		log.info(cart);
		return cart;
	}

	@Override
	public int delCart(Long cpno) {

		return this.cartMapper.delCart(cpno);
	}

	@Override
	public int delCartAll(CartListVO CartListVO) {
		return 0;
	}

	@Override
	public int delCartOrder(Map<String, Long> map) {
		return 0;
	}

	@Override
	public int getCartCount(CartListVO CartListVO) {
		return 0;
	}

	@Override
	public void delCartByOrder(Long mno, Long pno) {
		Map<String, Long> map = new HashMap<>();
		map.put("mno", mno);
		map.put("pno", pno);

		this.cartMapper.delCartByOrder(map);
	}

	@Override
	public CartListVO selectByPno(Long pno) {
		return null;
	}

}