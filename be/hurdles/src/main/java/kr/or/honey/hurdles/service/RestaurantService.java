package kr.or.honey.hurdles.service;


import kr.or.honey.hurdles.utils.Pagenation;
import kr.or.honey.hurdles.vo.RestaurantVo;

import java.util.List;

public interface RestaurantService {
    List<RestaurantVo> list(Pagenation<RestaurantVo> restaurantVo);

    RestaurantVo detail(RestaurantVo restaurantVo);

    int getTotalCount();
}
