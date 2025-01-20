package kr.or.ddit.service.pay;

import java.util.List;

import kr.or.ddit.dao.pay.PayDao;
import kr.or.ddit.vo.PayVo;

public class PayService implements IPayService {
	private static PayService instance;

	private PayService() {

	}

	public static PayService getInstance() {
		if (instance == null) {
			instance = new PayService();
		}

		return instance;
	}

	PayDao payDao = PayDao.getInstance();
	
	@Override
	public List<PayVo> payList(PayVo pay) {
		// TODO Auto-generated method stub
		return payDao.payList(pay);
	}

	@Override
	public PayVo payDetail(PayVo pay) {
		// TODO Auto-generated method stub
		return payDao.payDetail(pay);
	}

	@Override
	public int addressUpdate(PayVo pay) {
		// TODO Auto-generated method stub
		return payDao.addressUpdate(pay);
	}

	@Override
	public int payInsert(PayVo pay) {
		// TODO Auto-generated method stub
		return payDao.payInsert(pay);
	}
	
	public int getPayNo() {
		return payDao.getPayNo();
	}
}
