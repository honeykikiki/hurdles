package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class MileageVo {
	private int mileageNo;
	private int memberNo;
	private String mileageUsed;
	private String createDate;
	private int mileagePoint;
	
//	멤버 프로필에 담긴 이름 
	private String memberName;
	
//	음수 양수가 적용될 마일리지
	private int usedMileage;
	
//	실제 사용여부 
	private String usedused;
	
}

