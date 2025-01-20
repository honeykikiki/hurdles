package kr.or.ddit.vo;

import lombok.Data;

@Data
public class MenuVo {
	private int menuNo;
	private int restaurantNo;
	private int fileNo;
	private String menuName;
	private int menuPrice;
	private String menuDes;
	private String delyn;
	private String createDate;

	// 썸네일 파일
	private String fileSaveName;

	// 삭제할 이미지 id
	private int removeFileId;
}
