package kr.or.ddit.vo;

import lombok.Data;

@Data
public class OrdersVo {
	
	private int ordersNo;
	private int memberNo;
	private String ordersAdd1;
	private String ordersAdd2;
	private String createDate;
	private String removeDate;
	
	// 시퀀스오더 넘버
	private int nextval;
}
