package kr.or.honey.hurdles.mapper;

import kr.or.honey.hurdles.utils.Pagenation;
import kr.or.honey.hurdles.vo.RestaurantVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RestaurantMapper {
    List<RestaurantVo> list(Pagenation<RestaurantVo> searchVo);

    RestaurantVo detail(RestaurantVo restaurantVo);
}
