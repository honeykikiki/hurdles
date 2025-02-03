package kr.or.honey.hurdles.service.impl;

import kr.or.honey.hurdles.mapper.RestaurantMapper;
import kr.or.honey.hurdles.service.RestaurantService;
import kr.or.honey.hurdles.utils.Pagenation;
import kr.or.honey.hurdles.vo.RestaurantVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RestaurantServiceImpl implements RestaurantService {

    @Autowired
    RestaurantMapper restaurantMapper;

    @Override
    public List<RestaurantVo> list(Pagenation<RestaurantVo> searchVo) {

        return restaurantMapper.list(searchVo);
    }

    @Override
    public RestaurantVo detail(RestaurantVo restaurantVo) {
        return restaurantMapper.detail(restaurantVo);
    }
}
