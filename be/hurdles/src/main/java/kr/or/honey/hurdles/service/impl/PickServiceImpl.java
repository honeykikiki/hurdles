package kr.or.honey.hurdles.service.impl;

import kr.or.honey.hurdles.mapper.PickMapper;
import kr.or.honey.hurdles.service.PickService;
import kr.or.honey.hurdles.vo.PickVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PickServiceImpl implements PickService {
    @Autowired
    PickMapper pickMapper;

    @Override
    public int pick(PickVo pick) {
        return pickMapper.pick(pick);
    }

    @Override
    public int pickPop(PickVo pick) {
        return pickMapper.pickPop(pick);
    }
}
