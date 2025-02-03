package kr.or.honey.hurdles.mapper;

import kr.or.honey.hurdles.vo.MenuVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MenuMapper {
    public List<MenuVo> list(int restaurantNo);
}
