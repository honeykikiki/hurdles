package kr.or.ddit.vo;

import lombok.Data;

@Data
public class ProductVo {
	private int productNo;
	private int restaurantNo;
	private int fileNo;
	private String productName;
	private String productDes;
	private int productPrice;
	private String productYn;
	private String delyn;
	private String createDate;


	private String fileSaveName;
}
