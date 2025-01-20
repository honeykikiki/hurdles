
package kr.or.ddit.service.menu;

import java.util.List;

import kr.or.ddit.vo.MenuVo;
import kr.or.ddit.vo.ProductVo;

public interface IMenuService {
	public List<MenuVo> menuList(MenuVo param); // 메뉴 목록
	public List<ProductVo> productList(ProductVo param); // 주문 상품 목록
	public MenuVo menuDetail(MenuVo param); // 메뉴 상세
	public ProductVo productDetail(ProductVo param); // 주문 상품 상세
	
	public int getMenuNo(); // 메뉴 no 가져오기
	public int menuInsert(MenuVo param); // 메뉴 추가
	public int menuUpdate(MenuVo param); // 메뉴 수정
	public int menuDelete(MenuVo param); // 메뉴 삭제

	public int getProductNo(); // 배송상품 no 가져오기
	public int productInsert(ProductVo param); // 배송상품 추가
	public int productUpdate(ProductVo param); // 배송상품 수정
	public int productDelete(ProductVo param); // 배송상품 삭제

	public int getReserveProductNo(); // 예약상품 no 가져오기
}
