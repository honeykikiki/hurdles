package kr.or.honey.hurdles.mapper;

import kr.or.honey.hurdles.vo.PickVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PickMapper {
    public int pick(PickVo pick);

    public int pickPop(PickVo pick);
}

