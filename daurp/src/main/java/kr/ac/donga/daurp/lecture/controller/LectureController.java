package kr.ac.donga.daurp.lecture.controller;

import kr.ac.donga.daurp.lecture.service.LectureService;
import kr.ac.donga.daurp.util.Coolsms;
import org.json.simple.JSONObject;
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
public class LectureController {

    @Autowired
    LectureService lectureService;
    Logger logger = LoggerFactory.getLogger(LectureController.class);

    @RequestMapping(value = "/lecture/lectureEnroll", method = RequestMethod.GET)
    public String connectionLecture(Model model){

        List<Map<String,Object>> result = lectureService.lectureSelect();

        if (result.size() > 0) {
            logger.debug("PARAM-----"+result);
            logger.debug("RESULT-----"+result.get(0).get("lecture_code"));

            model.addAttribute("result",result.get(0).get("lecture_code"));
        }

        return "tiles.lecture/lectureEnroll";
    }

    @RequestMapping(value = "/lecture/lectureEnroll/add", method = RequestMethod.POST)
    public String addStudent(@RequestParam Map<String, Object> addParam){
        logger.debug("Map<String, Object> addParam = " + addParam);


        String message="에 신청이 접수되었습니다.";
        String receiver = addParam.get("NAME").toString();

        Map<String, Object> lecName = lectureService.lectureName_sms_search(addParam);
        lectureService.addStudent(addParam);

        /*SMS 문자 발송 코드*/
//        String api_key = "NCS2ULAPBQGFSPVO";
//        String api_secret = "SVQRIZSOEXNALMZABUSMASARJTKVNYEU";
//
//        Coolsms coolsms = new Coolsms(api_key, api_secret);
//
//        HashMap<String, String> set = new HashMap<>();
//        set.put("to", addParam.get("TEL").toString());
//
//        set.put("from", "01028879594");
//        set.put("text",receiver+"님"+ lecName.get("lecture_name") + message);
//        set.put("type", "sms");
//
//        JSONObject result = coolsms.send(set);
//
//        if((boolean)result.get("status") == true){
//            logger.debug(result.get("group_id").toString());
//            logger.debug(result.get("result_code").toString());
//            logger.debug(result.get("result_message").toString());
//            logger.debug(result.get("success_count").toString());
//            logger.debug(result.get("error_count").toString());
//
//        } else {
//            logger.debug("*****************메시지 수신 실패******************");
//            logger.debug(result.get("code").toString());
//            logger.debug(result.get("message").toString());
//        }

        return "redirect:/lecture/lectureEnroll";
    }

    @ResponseBody
    @RequestMapping(value = "/lecture/lectureEnroll/check")
    public Map<Object, Object> studentCheck(@RequestParam (value="param") List<String> param){
        logger.debug("Map<String, Object> userCheck = " + param);

        int count = 0;

        Map<Object, Object> result = new HashMap<>();
        count = lectureService.UserInfo(param);
        logger.debug("count = " + count);

        result.put("cnt", count);
        logger.debug("cnt = " + result);

        return result;
    }

    @RequestMapping(value = "/lecture/lectureConfirm")
    public String confirm(Model model){

        List<Map<String, Object>> lecName = lectureService.lectureSelect();

        model.addAttribute("lecName", lecName);

        return "tiles.lecture/lectureConfirm";
    }

    @RequestMapping(value = "/lecture/lectureConfirm/confirm", method=RequestMethod.POST)
    public String studentConfirm(Model model, @RequestParam Map<String, Object> Param){
        logger.debug("Map<String, Object> Param ="+ Param);

        Map<String, Object> result = lectureService.receipt(Param);

        logger.debug("result           :" + result);

        if(result == null){
            return "/error/DataNotFound";
        } else {

            lectureService.receipt(Param);
            model.addAttribute("student", result);
            return "tiles.lecture/lectureStudentInfo";
        }
    }

    @RequestMapping(value = "/jusoapi/jusoPopup")
    public String popup(){

        return "tiles.jusoapi/jusoPopup";
    }
    @RequestMapping(value="/regForm/lectureRegForm")
    public String regForm(){

        return "tiles.regForm/lectureRegForm";
    }
}