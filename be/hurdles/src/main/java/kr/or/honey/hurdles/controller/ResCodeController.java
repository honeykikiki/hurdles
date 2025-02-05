package kr.or.honey.hurdles.controller;

import kr.or.honey.hurdles.service.ResCodeService;
import kr.or.honey.hurdles.vo.ResCodeVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/resCode")
@ResponseBody
public class ResCodeController {
    @Autowired
    ResCodeService resCodeService;

    @GetMapping("/list")
    public Map<String, Object> list() {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        List<ResCodeVo> list = resCodeService.list();
        log.info("list -=> {}", list);
        resultMap.put("items", list);

        return resultMap;
    }
}
