package kr.or.ddit.service.menu;

import java.util.List;

import kr.or.ddit.dao.menu.MenuDao;
import kr.or.ddit.vo.MenuVo;
import kr.or.ddit.vo.ProductVo;

public class MenuService implements IMenuService {
	/* Singleton */
	private static MenuService instance;
	private MenuDao menuDao = MenuDao.getInstance();

	private MenuService() {
	}

	public static MenuService getInstance() {
		if (instance == null) {
			instance = new MenuService();
		}

		return instance;
	}

	@Override
	public List<MenuVo> menuList(MenuVo param) {
		return menuDao.menuList(param);
	}

	@Override
	public List<ProductVo> productList(ProductVo param) {
		return menuDao.productList(param);
	}


	@Override
	public MenuVo menuDetail(MenuVo param) {
		return menuDao.menuDetail(param);
	}

	@Override
	public ProductVo productDetail(ProductVo param) {
		return menuDao.productDetail(param);
	}


	@Override
	public int getMenuNo() {
		return menuDao.getMenuNo();
	}

	@Override
	public int menuInsert(MenuVo param) {
		return menuDao.menuInsert(param);
	}

	@Override
	public int menuUpdate(MenuVo param) {
		return menuDao.menuUpdate(param);
	}

	@Override
	public int menuDelete(MenuVo param) {
		return menuDao.menuDelete(param);
	}

	@Override
	public int getProductNo() {
		return menuDao.getProductNo();
	}

	@Override
	public int productInsert(ProductVo param) {
		return menuDao.productInsert(param);
	}

	@Override
	public int productUpdate(ProductVo param) {
		return menuDao.productUpdate(param);
	}

	@Override
	public int productDelete(ProductVo param) {
		return menuDao.productDelete(param);
	}

	@Override
	public int getReserveProductNo() {
		return menuDao.getReserveProductNo();
	}
}
