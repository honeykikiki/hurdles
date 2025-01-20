package kr.or.ddit.dao.reservation;

import java.util.List;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.ReservationVo;

public class ReservationDao extends MybatisDao implements IReservationDao {
	private static ReservationDao instance;

	private ReservationDao() {

	}

	public static ReservationDao getInstance() {
		if (instance == null) {
			instance = new ReservationDao();
		}

		return instance;
	}

	@Override
	public List<ReservationVo> reservationList(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return selectList("reservation.reservationList", reservation);
	}

	@Override
	public ReservationVo reservationDetail(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return selectOne("reservation.reservationDetail", reservation);
	}

	@Override
	public int reservationDelete(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return update("reservation.reservationDelete", reservation);
	}

	@Override
	public int reservationInsert(ReservationVo reservation) {
		// TODO Auto-generated method stub
		return insert("reservation.reservationInsert", reservation);
	}
}
