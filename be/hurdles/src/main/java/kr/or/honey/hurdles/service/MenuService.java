package kr.or.honey.hurdles.service;

import kr.or.honey.hurdles.vo.MenuVo;

import java.util.List;

public interface MenuService {

    List<MenuVo> list(int restaurantNo);
}
