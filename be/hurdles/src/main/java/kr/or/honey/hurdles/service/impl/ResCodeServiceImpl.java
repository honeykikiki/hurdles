package kr.or.honey.hurdles.service.impl;

import kr.or.honey.hurdles.mapper.ResCodeMapper;
import kr.or.honey.hurdles.service.ResCodeService;
import kr.or.honey.hurdles.vo.ResCodeVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ResCodeServiceImpl implements ResCodeService {
    @Autowired
    ResCodeMapper resCodeMapper;

    @Override
    public List<ResCodeVo> list() {
        return resCodeMapper.list();
    }
}
