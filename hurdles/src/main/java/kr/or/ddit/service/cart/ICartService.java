package kr.or.ddit.service.cart;

import java.util.List;

import kr.or.ddit.vo.CartVo;

public interface ICartService {
	
	//장바구니 조회 
	public List<CartVo> list (CartVo cart);
	
	//장바구니 생성
	public int insert(CartVo cart);
	
	//장바구니 수정
	public int update(CartVo cart);
	
	//장바구니 삭제
	public int delete(int[] removeId);

	//장바구니 상품수량 업데이트 - 김영신 제작중
	public int cartQtyUpdate(CartVo cart);
	
	//선택된 장바구니 번호 얻기
	public CartVo getCartByCartNo(int cartNo);

	//선택된 장바구니 삭제
	public int cartDelete(CartVo cart);
}
