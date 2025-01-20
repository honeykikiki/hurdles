package kr.or.ddit.dao.pay;

import java.util.List;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.PayVo;

public class PayDao extends MybatisDao implements IPayDao {
	private static PayDao instance;

	private PayDao() {

	}

	public static PayDao getInstance() {
		if (instance == null) {
			instance = new PayDao();
		}

		return instance;
	}

	@Override
	public List<PayVo> payList(PayVo pay) {
		// TODO Auto-generated method stub
		return selectList("pay.payList", pay);
	}

	@Override
	public PayVo payDetail(PayVo pay) {
		// TODO Auto-generated method stub
		return selectOne("pay.payDetail", pay);
	}

	@Override
	public int addressUpdate(PayVo pay) {
		// TODO Auto-generated method stub
		return update("pay.addressUpdate", pay);
	}

	@Override
	public int payInsert(PayVo pay) {
		// TODO Auto-generated method stub
		return insert("pay.payInsert", pay);
	}
	
	public int getPayNo() {
		
		return selectOne("pay.getPayNo");
	}
	
}
