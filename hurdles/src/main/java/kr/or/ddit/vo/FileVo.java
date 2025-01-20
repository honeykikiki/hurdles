package kr.or.ddit.vo;

import lombok.Data;

@Data
public class FileVo {
	private int fileNo;
	private int fileSn;
	private String filePath;
	private String fileOrgName;
	private String fileSaveName;
	private String fileExt;
	private long fileSize;
	private String createDate;
	private String delyn;
}
