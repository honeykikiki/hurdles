package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ReviewVo {
	
	private int reviewNo;
	private int restaurantNo;
	private int memberNo;
	private String reviewContent;
	private int reviewScore;
	private String createDate;
	private String delyn;
	private int ordersNo;
	private int attributeNo;

	private int fileNo;
	private String restaurantName;
	private String productName;
	private int ordersProductQty;

	// 리뷰 작성자 정보
	private String memberName;
	private String fileSaveName;

	
	private int followNo; // 로그인 한 사람이 팔로우 여부
	
	
	private String restaurantTel;
	//식당 주소
	private String restaurantAdd1;
	
	private String restaurantAdd2;
	
	//식당 속성
	private String attributeName;
	
	private String reviewReportDes;
}
