package kr.or.ddit.vo;

import lombok.Data;

@Data
public class BoardVo {
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private String createDate;
	private String updateDate;
	private int boardCodeNo;
	private int memberNo;
	private String delyn;
	
	private String memberName;
	
	//rownum
	private String rm; 
	//memberId ->공지게시판 작성자id 가져오려고 
	private String memberId;
}
