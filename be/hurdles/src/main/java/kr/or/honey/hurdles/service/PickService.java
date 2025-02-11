package kr.or.honey.hurdles.service;

import kr.or.honey.hurdles.vo.PickVo;

public interface PickService {
    public int pick(PickVo pick);

    public int pickPop(PickVo pick);
}
