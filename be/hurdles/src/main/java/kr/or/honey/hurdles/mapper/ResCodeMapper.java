package kr.or.honey.hurdles.mapper;

import kr.or.honey.hurdles.vo.ResCodeVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResCodeMapper {

    List<ResCodeVo> list();
}
