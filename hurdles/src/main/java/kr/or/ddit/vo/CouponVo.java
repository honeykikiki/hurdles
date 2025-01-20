package kr.or.ddit.vo;

import lombok.Data;

@Data
public class CouponVo {
	private int couponNo;
	private int restaurantNo;
	private String couponName;
	private String couponDes;
	private int couponPrice;
	private String startDate;
	private String endDate;
	private String createDate;
	private String delyn;

	private int memberNo; // 발급 대상 멤버
	private String issued; // 발급 여부
	
	private String useDate; // 사용 여부 있으면 사용 없으면 미사용
	
	private int payNo;
	private String restaurantName;
}
