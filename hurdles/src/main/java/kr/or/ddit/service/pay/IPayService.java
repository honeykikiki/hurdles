package kr.or.ddit.service.pay;

import java.util.List;

import kr.or.ddit.vo.PayVo;

public interface IPayService {

	// 결제내역 조회 - 김영신 제작중
	public List<PayVo> payList(PayVo pay);

	// 결제내역 상세조회 - 김영신 제작중
	public PayVo payDetail(PayVo pay);
	
	// 결제시 주소 변경 - 김영신 제작중
	public int addressUpdate(PayVo pay);
	
	// 결제성공 후 결제내역 리스트에 추가
	public int payInsert(PayVo pay);
	
}
