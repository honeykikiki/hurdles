package kr.or.ddit.vo;

import lombok.Data;

@Data
public class QuestionVo {
	private int questionNo;
	private String questionTitle;
	private String questionContent;
	private String createDate;
	private String updateDate;
	private String questionAnswer;
	private int memberNo;
	private int restaurantNo;
	private int fileNo;
	
	//memberId (작성자 가져오려고)
	private String memberId;
	// 파일경로 
	private String filePath;
	//리스트를 위한 rownum
	private String rm; 
	//댓글 권한을 위한 memberRole
	private int memberRole;
	
	//restaurant 
	private int restaurantCodeNo;
	private int localNo;
	private String restaurantName;
	private String restaurantDes;
	private String restaurantAdd1;
	private String restaurantAdd2;
	private String restaurantTel;
	private String delyn;
	private int restaurantX;
	private int restaurantY;
	
	//memberprofile
	private String memberName;
	private String memberBir;
	private String memberGender;
	private String memberAdd1;
	private String memberAdd2;
	private String memberTel;
	private String memberEmail;
	private int memberMileage;
	private int gradeNo;
	private int benCnt;
	
	
	private String fileSaveName;

}
