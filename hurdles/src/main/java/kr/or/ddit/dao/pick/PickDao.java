package kr.or.ddit.dao.pick;

import java.util.List;

import kr.or.ddit.util.Pagenation;
import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.RestaurantVo;

public class PickDao extends MybatisDao implements IPickDao {
	private static PickDao instance;

	private PickDao() {

	}

	public static PickDao getInstance() {
		if (instance == null) {
			instance = new PickDao();
		}

		return instance;
	}

	@Override
	public List<RestaurantVo> pickRestaurantList(Pagenation<RestaurantVo> pagenation) {
		return selectList("restaurant.pickRestaurantList", pagenation);
	}

	@Override
	public int getTotalPageCount(Pagenation<RestaurantVo> pagenation) {
		return selectOne("restaurant.getPickCount", pagenation);
	}

	@Override
	public int insertPick(RestaurantVo restaurant) {
		return insert("member.restaurantPick", restaurant);
	}

	@Override
	public int deletePick(RestaurantVo restaurant) {
		return insert("member.restaurantPickDelete", restaurant);
	}


}
