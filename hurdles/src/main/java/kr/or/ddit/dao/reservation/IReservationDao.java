package kr.or.ddit.dao.reservation;

import java.util.List;

import kr.or.ddit.vo.ReservationVo;

public interface IReservationDao {
	
	// 예약내역 전체조회
	public List<ReservationVo> reservationList(ReservationVo reservation);
	
	// 예약내역 상세조회 
	public ReservationVo reservationDetail(ReservationVo reservation);
	
	// 예약 삭제(취소) 
	public int reservationDelete(ReservationVo reservation);
	
	// 예약 등록 - 김영신 제작중
	public int reservationInsert(ReservationVo reservation);
	
}
