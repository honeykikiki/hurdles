package kr.or.ddit.service.coupon;

import java.util.List;

import kr.or.ddit.dao.coupon.CouponDao;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.CouponVo;

public class CouponService implements ICouponService {
	/*Singleton*/
	private static CouponService instance;
	private CouponDao couponDao = CouponDao.getInstance();

	private CouponService() {
	}

	public static CouponService getInstance() {
		if (instance == null) {
			instance = new CouponService();
		}

		return instance;
	}

	@Override
	public List<CouponVo> list(CouponVo param) {
		return couponDao.list(param);
	}

	@Override
	public int insert(CouponVo param) {
		return couponDao.insert(param);
	}

	@Override
	public int use(CouponVo param) {
		return couponDao.use(param);
	}

	@Override
	public List<CouponVo> issuedList(Pagenation<CouponVo> param) {
		return couponDao.issuedList(param);
	}

	@Override
	public List<CouponVo> memberCouponList(CouponVo coupon) {
		// TODO Auto-generated method stub
		return couponDao.memberCouponList(coupon);
	}
}
