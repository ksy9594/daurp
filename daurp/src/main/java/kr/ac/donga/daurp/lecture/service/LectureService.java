package kr.ac.donga.daurp.lecture.service;

import ngel.core.service.AbstractCommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class LectureService extends AbstractCommonService {
    Logger logger = LoggerFactory.getLogger(LectureService.class);

    public void addStudent(Map<String, Object> param) {

//        logger.debug("1--------" + param.get("NAME").toString());

        mapper.insert("Lecture.addStudent", param);
    }
    public Map<String, Object> receipt(Map<String, Object> param){

        logger.info("Param : " + param.toString());

        Map<String, Object> student = mapper.get("Lecture.receiptStudent", param);

        return student;
    }
    public int UserInfo(List<String> param){

        Map<String, Object> map = new HashMap<>();

        map.put("TEL", param.get(0));

        logger.info("Service Result -------------" + map);

        int result = mapper.get("Lecture.memberCheck", map);
        logger.info("Service Result -------------" + result);

        return result;
    }
    public List<Map<String, Object>> lectureSelect(){

        List<Map<String, Object>> list = mapper.select("Lecture.lectureSelect");

        return list;
    }
    public Map<String, Object> lectureName_sms_search(Map<String, Object> param){
        Map<String, Object> lecName = mapper.get("Lecture.lectureName_sms_search", param);

        return lecName;
    }
}
