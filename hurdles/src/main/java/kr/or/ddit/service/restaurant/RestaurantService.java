package kr.or.ddit.service.restaurant;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.dao.restaurant.RestaurantDao;
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.LocalVo;
import kr.or.ddit.vo.RestaurantCodeVo;
import kr.or.ddit.vo.RestaurantVo;
import kr.or.ddit.vo.ReviewVo;

public class RestaurantService implements IRestaurantService {
	private static RestaurantService instance;

	private RestaurantService() {

	}

	public static RestaurantService getInstance() {
		if (instance == null) {
			instance = new RestaurantService();
		}

		return instance;
	}

	RestaurantDao resDao = RestaurantDao.getInstance();

	@Override
	public List<RestaurantVo> restaurantList(Pagenation<RestaurantVo> pagenation) {
		return resDao.restaurantList(pagenation);
	}

	public int getTotalPageCount(Pagenation<RestaurantVo> pagenation) {
		return resDao.getTotalPageCount(pagenation);
	}
	

	@Override
	public List<RestaurantVo> list(Pagenation<RestaurantVo> param) {
		return resDao.list(param);
	}

	@Override
	public RestaurantVo detail(RestaurantVo param) {
		return resDao.detail(param);
	}

	@Override
	public int insert(RestaurantVo param) {
		return resDao.insert(param);
	}

	@Override
	public int update(RestaurantVo param) {
		return resDao.update(param);
	}

	@Override
	public int remove(RestaurantVo param) {
		return resDao.remove(param);
	}

	@Override
	public int getAllCount(Pagenation<RestaurantVo> param) {
		return resDao.getAllCount(param);
	}

	@Override
	public int getNo() {
		return resDao.getNo();
	}

	public void restaurantFileInsert(List<FileVo> fileList, int resNo) {
		List<Map<String, Object>> param = new ArrayList<Map<String, Object>>();
		for (FileVo file : fileList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_no", resNo);
			map.put("file_no", file.getFileNo());
			param.add(map);
		}

		resDao.restaurantFileInsert(param);
	}


	@Override
	public List<FileVo> getFileList(RestaurantVo param) {
		return resDao.getFileList(param);
	}

	@Override
	public void restrauntFileDelete(int[] removeFileIdList) {
		resDao.restrauntFileDelete(removeFileIdList);
	}
}
