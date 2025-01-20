package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CartVo {
	
	private int cartNo;
	private int memberNo;
	private int productNo;
	private int productQty;
	
	//상품이름
	private String productName;
	
	//상품가격
	private int productPrice;
	
	//식당이름
	private String restaurantName;
	private int restaurantNo;
	

}
