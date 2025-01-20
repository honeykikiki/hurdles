package kr.or.ddit.vo;

import lombok.Data;

@Data
public class RestaurantVo {
	private int restaurantNo;
	private int restaurantCodeNo;
	private int localNo;
	private int memberNo;
	private int fileNo;
	private String restaurantName;
	private String restaurantDes;
	private String restaurantAdd1;
	private String restaurantAdd2;
	private String restaurantTel;
	private String delyn;
	private double restaurantX;
	private double restaurantY;
	private String createDate;
	
	// 썸네일 파일
	private String fileSaveName;
	
	// 사장님 이름
	private String memName;
	
	private String resturantCodeName; // 카테고리 명
	
	// 삭제할 이미지 id
	private int[] removeFileId;
	
	private double score; // 레스토랑 평점
	private int reviewCnt; // 리뷰 카운트
	
	// 0 => 기본, 1 => 평정 높은순, 2 평점 낮은순
	private int orderScore;
	private int pick = 0; // 0인경우 픽이 안되어 있는것임
}
