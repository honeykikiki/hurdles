package kr.or.ddit.service.coupon;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.CouponVo;

public interface ICouponService {
	// 쿠폰 목록 (식당별) 
	public List<CouponVo> issuedList(Pagenation<CouponVo> param);
	
	// 쿠폰 목록 (식당별) 
	public List<CouponVo> list(CouponVo param);
	
	// 쿠폰 발급
	public int insert(CouponVo param);
	
	// 쿠폰 사용
	public int use(CouponVo param);
	
	// 회원이 발급받은 쿠폰 목록(사용안한) - 김영신
	public List<CouponVo> memberCouponList(CouponVo coupon);
}
