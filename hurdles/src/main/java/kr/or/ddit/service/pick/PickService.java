package kr.or.ddit.service.pick;

import java.util.List;

import kr.or.ddit.dao.pick.PickDao;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.RestaurantVo;

public class PickService implements IPickService {
	private static PickService instance;

	private PickService() {

	}

	public static PickService getInstance() {
		if (instance == null) {
			instance = new PickService();
		}

		return instance;
	}
	
	PickDao pickDao = PickDao.getInstance();
	


	@Override
	public List<RestaurantVo> pickRestaurantList(Pagenation<RestaurantVo> pagenation) {
		return pickDao.pickRestaurantList(pagenation);
	}

	@Override
	public int getTotalPageCount(Pagenation<RestaurantVo> pagenation) {
		return pickDao.getTotalPageCount(pagenation);
	}

	@Override
	public int insertPick(RestaurantVo restaurant) {
		return pickDao.insertPick(restaurant);
	}

	@Override
	public int deletePick(RestaurantVo restaurant) {
		return pickDao.deletePick(restaurant);
	}
}


