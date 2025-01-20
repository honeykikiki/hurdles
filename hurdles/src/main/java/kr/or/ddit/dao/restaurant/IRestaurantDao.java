package kr.or.ddit.dao.restaurant;

import java.util.List;
	// 식당 상세정보

// 
import kr.or.ddit.util.Pagenation;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.LocalVo;
import kr.or.ddit.vo.RestaurantCodeVo;
import kr.or.ddit.vo.RestaurantVo;

public interface IRestaurantDao {
	public List<RestaurantVo> restaurantList(Pagenation<RestaurantVo> pagenation);
	
	public int getTotalPageCount(Pagenation<RestaurantVo> pagenation);
	
	// 식당 전체 개수 - 허 
	public int getAllCount(Pagenation<RestaurantVo> param);
	
	// 식당 목록 - 허
	public List<RestaurantVo> list(Pagenation<RestaurantVo> param);
	
	// 식당 상세보기 - 허
	public RestaurantVo detail(RestaurantVo param);
	
	// 식당 추가 - 허
	public int insert(RestaurantVo param);
	
	// 식당 삭제 - 허
	public int remove(RestaurantVo param);
	
	// 식당 이미지 가져오기
	public List<FileVo> getFileList(RestaurantVo param);
	
	// 식당 넘버 가져오기 - 허
	public int getNo();
	
	// 식당 수정 - 허
	public int update(RestaurantVo param);
	
	// 식당 파일 연결 처리 삭제 - 허
	public void restrauntFileDelete(int[] removeFileIdList);
	
	// 식당_파일 추가 - 허
	public void restaurantFileInsert(List<FileVo> fileList, int resNo);

}
