package kr.or.ddit.service.reservation;

import java.util.List;

import kr.or.ddit.vo.ReservationVo;

public interface IReservationService {
	
	// 예약내역 전체조회
	public List<ReservationVo> reservationList(ReservationVo reservation);
	
	// 예약내역 상세조회 
	public ReservationVo reservationDetail(ReservationVo reservation);
	
	// 예약 취소
	public int reservationDelete(ReservationVo reservation);
	
	// 예약 등록 - 김영신 제작중
	public int reservationInsert(ReservationVo reservation);
}
