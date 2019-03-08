package kr.ac.donga.daurp.lecture.controller;

import kr.ac.donga.daurp.lecture.service.AttendCheckService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class AttendCheckController {

    @Autowired
    AttendCheckService attendCheckService;

    Logger logger = LoggerFactory.getLogger(AttendCheckController.class);

    @RequestMapping(value = "/attndchk/attndChk", method = RequestMethod.GET)
    public String AttndChk(Model model,
                            @RequestParam Map<String, Object> param){

        List<Map<String, Object>> list = attendCheckService.attndStudentSelect(param);


        model.addAttribute("list", list);

        return "tiles.attndchk/attndChk";
    }

    @RequestMapping (value = "/attndchk/searchStudent", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> searchStudent (@RequestParam Map<String, Object> param) {
        return attendCheckService.attndStudentSelect(param);
    }

    @RequestMapping(value = "/attndchk/attndChk/attndStudentInfo", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> attndStudentInfo(@RequestParam Map<String,Object> param){

        Map<String, Object> entranceChk = attendCheckService.isEntranceChk(param);

        Map<String, Object> result = attendCheckService.studentInfo(param);

        result.put("entranceChk", entranceChk);

        return result;
    }

    @RequestMapping(value = "/attndchk/attndChk/isAttendChk", method = RequestMethod.GET)
    @ResponseBody
    public String isAttndChk(@RequestParam Map<String, Object> param) {
          logger.debug("param       :     " + param);
          Map<String, Object> entranceChk = attendCheckService.isEntranceChk(param);


          if(entranceChk == null){
              Map<String, Object> list = new HashMap<>();

              list.put("lecture_code", param.get("lecture_code"));
              list.put("LEC_SEQ", param.get("LEC_SEQ"));

              attendCheckService.entranceStudent(list);
          } else {
              param.put("SEQ", entranceChk.get("seq"));
              attendCheckService.attendGetOut(param);
          }
        return "tiles.attndchk/attndChk";
    }
}
