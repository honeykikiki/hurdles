package kr.or.honey.hurdles.controller;

import kr.or.honey.hurdles.service.MenuService;
import kr.or.honey.hurdles.service.RestaurantService;
import kr.or.honey.hurdles.utils.Constants;
import kr.or.honey.hurdles.utils.Pagenation;
import kr.or.honey.hurdles.vo.MenuVo;
import kr.or.honey.hurdles.vo.RestaurantVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/res")
@ResponseBody
public class RestaurantController {

    @Autowired
    RestaurantService restaurantService;

    @Autowired
    MenuService menuService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Map<String, Object> list(Pagenation<RestaurantVo> pagenation,
                                    RestaurantVo restaurantVo) {
        Map<String, Object> resultMap = new HashMap<String, Object>();

        pagenation.setSearchVo(restaurantVo);
//        log.info("pagenation => {}", pagenation);
        List<RestaurantVo> list = restaurantService.list(pagenation);
        int totalCount = restaurantService.getTotalCount();
        pagenation.setTotalRecordCount(totalCount);
        log.info("list => {}", list);
        resultMap.put("paginationInfo", pagenation);
        resultMap.put("filePath", Constants.FILE_SAVE_PATH);
        resultMap.put("items", list);
        return resultMap;
    }

    @GetMapping("/detail")
    public Map<String, Object> detail(RestaurantVo restaurantVo) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        RestaurantVo restaurant = restaurantService.detail(restaurantVo);

        // 메뉴 가져오기
        List<MenuVo> menuList = menuService.list(restaurant.getRestaurantNo());
        restaurant.setMenuList(menuList);
        resultMap.put("item", restaurant);

        resultMap.put("filePath", Constants.FILE_SAVE_PATH);
        return resultMap;
    }
}
