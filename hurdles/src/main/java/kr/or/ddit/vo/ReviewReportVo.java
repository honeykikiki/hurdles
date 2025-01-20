package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ReviewReportVo {
	
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
	
	private String memberName;
	
	private String fileSaveName;
	
	private int reviewReportNo;
	
	private String reviewReportDes;
	
	private int targetMemberNo;

	private String targetMemberName;
	
	private String reviewReportAction;
}
