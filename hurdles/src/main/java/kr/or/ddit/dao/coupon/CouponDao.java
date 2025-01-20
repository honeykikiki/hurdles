package kr.or.ddit.dao.coupon;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.CouponVo;

public class CouponDao extends MybatisDao implements ICouponDao {
	/*Singleton*/
	private static CouponDao instance;

	private CouponDao() {
	}

	public static CouponDao getInstance() {
		if (instance == null) {
			instance = new CouponDao();
		}

		return instance;
	}

	@Override
	public List<CouponVo> list(CouponVo param) {
		return selectList("coupon.list", param);
	}

	@Override
	public int insert(CouponVo param) {
		return insert("coupon.issued", param);
	}

	@Override
	public int use(CouponVo param) {
		return insert("coupon.memberCouponInsert", param);
	}

	@Override
	public List<CouponVo> issuedList(Pagenation<CouponVo> param) {
		return selectList("coupon.issuedList", param);
	}

	@Override
	public List<CouponVo> memberCouponList(CouponVo coupon) {
		// TODO Auto-generated method stub
		return selectList("coupon.memberCouponList", coupon);
	}

	
}
