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
public class AttendCheckService extends AbstractCommonService {

    Logger logger = LoggerFactory.getLogger(AttendCheckService.class);

    public List<Map<String, Object>> attndStudentSelect(Map<String, Object> param){
        return mapper.select("Lecture.studentSelect", param);
    }
    public Map<String,Object> studentInfo(Map<String, Object> param){

        Map<String, Object> result = mapper.get("Lecture.studentInfo",param);

        logger.debug("result       :     "+result);

        return result;
    }
    public void entranceStudent(Map<String, Object> param){
        mapper.insert("Lecture.attendInsert",param);
    }

    public Map<String, Object> isEntranceChk(Map<String, Object> param){

        Map<String, Object> result = mapper.get("Lecture.isEntranceChk", param);

        return result;
    }
    public void attendGetOut(Map<String, Object> param){
        mapper.update("Lecture.attendGetOut", param);
    }
}
