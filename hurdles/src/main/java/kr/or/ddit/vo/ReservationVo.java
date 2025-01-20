 package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ReservationVo {
	
	private int reservationNo;
	private int reserveProductNo;
	private int memberNo;
	private String createDate;
	private String reserveDate;
	private String reserveTime;
	private int guests;
	
	// 식당이름
	private String restaurantName;
	
	// 식당전화번호
	private String restaurantTel;
	
	// 식당주소
	private String addr;

	// 예약메뉴상품
	private String reserveProductName;
	
	// 식당번호
	private int restaurantNo;
	
	// 멤버이름
	private String memberName;
	
	// 멤버전화번호
	private String memberTel;
	
	private String delYn;
}
