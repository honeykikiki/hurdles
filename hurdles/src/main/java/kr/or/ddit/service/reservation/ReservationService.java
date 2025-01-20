package kr.or.ddit.service.reservation;

import java.util.List;

import kr.or.ddit.dao.reservation.IReservationDao;
import kr.or.ddit.dao.reservation.ReservationDao;
import kr.or.ddit.vo.ReservationVo;

public class ReservationService implements IReservationService {
	private static ReservationService instance;

	private ReservationService() {

	}

	public static ReservationService getInstance() {
		if (instance == null) {
			instance = new ReservationService();
		}

		return instance;
	}
	
	IReservationDao reservedao = ReservationDao.getInstance();
	
	@Override
	public List<ReservationVo> reservationList(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return reservedao.reservationList(reservation);
	}

	@Override
	public ReservationVo reservationDetail(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return reservedao.reservationDetail(reservation);
	}

	@Override
	public int reservationDelete(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return reservedao.reservationDelete(reservation);
	}

	@Override
	public int reservationInsert(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return reservedao.reservationInsert(reservation);
	}
}
