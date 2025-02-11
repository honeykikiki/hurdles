package kr.or.honey.hurdles.controller;

import kr.or.honey.hurdles.service.PickService;
import kr.or.honey.hurdles.vo.PickVo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/pick")
@ResponseBody
public class PickController {
    @Autowired
    private PickService pickService;

    @PostMapping("/pick")
    public Map<String, Object> pick(PickVo pick) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        log.info("pick => {}", pick);
        try {
            int picked = pickService.pick(pick);
            if (picked == 1) {
                resultMap.put("item", "success");
                resultMap.put("code", 1);
            } else {
                resultMap.put("item", "fail");
                resultMap.put("code", 0);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            resultMap.put("item", "fail");
        }

        return resultMap;
    }

    @PostMapping("/pickPop")
    public Map<String, Object> pickPop(PickVo pick) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        try {
            int picked = pickService.pickPop(pick);
            if (picked == 1) {
                resultMap.put("item", "success");
                resultMap.put("code", 1);
            } else {
                resultMap.put("item", "fail");
                resultMap.put("code", 0);
            }
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            resultMap.put("item", "fail");
        }

        return resultMap;
    }
}
