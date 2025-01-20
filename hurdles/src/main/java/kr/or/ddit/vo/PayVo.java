package kr.or.ddit.vo;

import lombok.Data;

@Data
public class PayVo {

	private int payNo;
	private int ordersNo;
	private String createDate;
	private String removeDate;
	private int payPlus;
	private int payMinus;
	private int payCoupon;
	private int payTotalPrice;
	private int payPrice;
	
	//멤버 번호
	private int memberNo;
	
	//상품명
	private String productName;
	
	//상품가격
	private String productPrice;
	
	//식당번호
	private int restaurantNo;
	
	//식당이름
	private String restaurantName;

	//멤버 기본주소
	private String memberAdd1;
	
	//멤버 상세주소
	private String memberAdd2;
	
	private String memberName;
	
	private int nextval;
	
	private String ordersAdd1;
	private String ordersAdd2;
	
	private int price;
	
}
