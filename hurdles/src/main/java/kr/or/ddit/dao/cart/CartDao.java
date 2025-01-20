package kr.or.ddit.dao.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.CartVo;

public class CartDao extends MybatisDao implements ICartDao {
	private static CartDao instance;

	private CartDao() {

	}

	public static CartDao getInstance() {
		if (instance == null) {
			instance = new CartDao();
		}

		return instance;
	}

	@Override
	public List<CartVo> list(CartVo cart) {
		
		return selectList("cart.list",cart);
	}

	@Override
	public int insert(CartVo cart) {
		
		return insert("cart.insert", cart);
	}

	@Override
	public int update(CartVo cart) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int cartQtyUpdate(CartVo cart) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("cartNo", cart.getCartNo());
		params.put("productQty", cart.getProductQty());
		return update("cart.updateProductQty", params);
	}

	@Override
	public CartVo getCartByCartNo(int cartNo) {
		// TODO Auto-generated method stub
		return selectOne("cart.getCartByCartNo", cartNo);
	}

	@Override
	public int delete(int[] removeId) {
		// TODO Auto-generated method stub
		return delete("cart.delete", removeId);
	}

	@Override
	public int cartDelete(CartVo cart) {
		// TODO Auto-generated method stub
		return delete("cart.cartDelete", cart);
	}

	
}
