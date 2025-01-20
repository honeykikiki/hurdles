package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MemberVo {
	private int memberNo = 0;
	private String memberId;
	private String memberPw;
	private String delyn;
	private String createDate;
	private String removeDate;
	private int memberRole; // 0 => 관리자, 1 => 사장님 & 일반 사용자, 2 => 일반 사용자, 4 => 블랙 리스트

	private String memberName;
	private String memberBir;
	private String memberGender; // 0 => 남 1 => 여
	private String memberAdd1;
	private String memberAdd2;
	private String memberTel;
	private String memberEmail;
	private int memberMileage; // 마일리지
	private String field;
	private int fileNo;
	private int gradeNo;

	private int benCnt; // 신고 카운트

	// 등급명
	private String gradeName;

	// 세션 마이 넘버
	private int targetNo;

	// follow테이블 follow 넘버
	private int followNo;
	// follow를 하려는 대상 넘버
	private int followTargetNo;

	private String filePath; // 프로필 파일 경로
	private int followCnt = 0; // 팔로우 카운트
	private int followingCnt = 0; // 팔로워 카운트
	private int pickCnt = 0; // 찜한 식당 카운트
	private int reservationCnt = 0; // 예약 카운트
	private int couponCnt = 0; // 쿠폰 카운트
	private int questionCnt = 0; // 문의 카운트
	private int reviewCnt = 0; // 리뷰 카운트
	private int cartCnt = 0; // 카트 카운트

	private int removeFileId; // 삭제할 파일 id

	// admin 화면 회원 상세보기
	private int couponNo;
	private String couponName;
	private int mileagePoint;
	private String useDate;
	
	//마일리지 계산
	private int mileageDifference;

}
