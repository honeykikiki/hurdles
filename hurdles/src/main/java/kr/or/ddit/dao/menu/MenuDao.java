package kr.or.ddit.dao.menu;

import java.util.List;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.MenuVo;
import kr.or.ddit.vo.ProductVo;

public class MenuDao extends MybatisDao implements IMenuDao {
	/* Singleton */
	private static MenuDao instance;

	private MenuDao() {
	}

	public static MenuDao getInstance() {
		if (instance == null) {
			instance = new MenuDao();
		}

		return instance;
	}

	@Override
	public List<MenuVo> menuList(MenuVo param) {
		return selectList("menu.menuList", param);
	}

	@Override
	public List<ProductVo> productList(ProductVo param) {
		return selectList("menu.productList", param);
	}



	@Override
	public MenuVo menuDetail(MenuVo param) {
		return selectOne("menu.menuDetail", param);
	}

	@Override
	public ProductVo productDetail(ProductVo param) {
		return selectOne("menu.productDetail", param);
	}


	@Override
	public int getMenuNo() {
		return selectOne("menu.getMenuNo");
	}

	@Override
	public int menuInsert(MenuVo param) {
		return insert("menu.menuInsert", param);
	}

	@Override
	public int menuUpdate(MenuVo param) {
		return update("menu.menuUpdate", param);
	}

	@Override
	public int menuDelete(MenuVo param) {
		return delete("menu.menuDelete", param);
	}

	@Override
	public int getProductNo() {
		return selectOne("menu.getProductNo");
	}

	@Override
	public int productInsert(ProductVo param) {
		return insert("menu.productInsert", param);
	}

	@Override
	public int productUpdate(ProductVo param) {
		return update("menu.productUpdate", param);
	}

	@Override
	public int productDelete(ProductVo param) {
		return delete("menu.productDelete", param);
	}

	@Override
	public int getReserveProductNo() {
		return selectOne("menu.getReserveProductNo");
	}


}
