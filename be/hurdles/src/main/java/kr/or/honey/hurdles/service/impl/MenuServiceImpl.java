package kr.or.honey.hurdles.service.impl;

import kr.or.honey.hurdles.mapper.MenuMapper;
import kr.or.honey.hurdles.service.MenuService;
import kr.or.honey.hurdles.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    MenuMapper menuMapper;

    @Override
    public List<MenuVo> list(int restaurantNo) {
        return menuMapper.list(restaurantNo);
    }
}
