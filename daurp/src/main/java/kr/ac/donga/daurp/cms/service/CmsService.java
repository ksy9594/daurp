package kr.ac.donga.daurp.cms.service;

import kr.ac.donga.daurp.util.ExcelRead;
import kr.ac.donga.daurp.util.ExcelReadOption;
import ngel.core.service.AbstractCommonService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CmsService extends AbstractCommonService
{
    public void excelUpload(File destFile) throws Exception{
        ExcelReadOption excelReadOption = new ExcelReadOption();
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        excelReadOption.setOutputColumns("A","B");
        excelReadOption.setStartRow(2);

        List<Map<String, String>> excelContent = ExcelRead.read(excelReadOption);
        Map<Object, String> param = new HashMap<>();

        for(Map<String, String> article:excelContent){
            param.put("DESPOIT", article.get("B"));
            param.put("NAME", article.get("A"));
            mapper.update("Certificate.isDespoitUpdate", param);
        }
    }
    public List<Object> certificateUserInfo(){
        List<Object> list = mapper.select("Certificate.certificateUserInfo");

        return list;
    }
    public List<Object> lectureStudentInfo(){
        List<Object> list = mapper.select("Lecture.studentInfo");

        return list;
    }
    public List<Object> cmsAttendChk(Map<String, Object> param) {

        logger.debug("param date : "+ param);

        List<Object> list = mapper.select("Lecture.attendInfo", param);

        return list;
    }

    public void addLecture(Map<String, Object> param) {

        mapper.insert("Lecture.lectureInsert", param);
    }
    public List<Object> lectureSelect(){

        List<Object> list = mapper.select("Lecture.lectureSelect");

        return list;
    }
    public List<Object> cntSubjectcode(Map<String, Object> param){

        List<Object> list = mapper.select("Lecture.subjectSelect");

        return list;
    }

    public void addSubject(Map<String, Object> param){
        mapper.insert("Lecture.SubjectInsert",param);
    }

    public void cmsaddCertificateDegree(Map<String, Object> param){
        mapper.insert("Certificate.addCertificateDegree",param);
    }

    /*cmsAuthList 권한 리스트 관리*/
    public void cmsAuthListAdd(Map<String, Object> param){
        mapper.insert("cms.addCmsAuthList", param);
    }

    public List<Map<String, Object>> cmsAuthListSelect(){
        return mapper.select("cms.selectCmsAuthList");
    }
    public int cmsAuthListDelete(Map<String, Object> param){
        return mapper.delete("cms.deleteCmsAuthList", param);
    }

    /*cmsUrlList 권한 리스트 관리*/
    public void cmsUrlListAdd(Map<String, Object> param){
        mapper.insert("cms.addCmsUrlList", param);
    }
    public List<Map<String, Object>> cmsUrlListSelect(Map<String, Object> param){
        return mapper.select("cms.selectCmsUrlList", param);
    }
    public int cmsUrlListDelete(Map<String, Object> param){
        logger.debug("param      "   + param);

        return mapper.delete("cms.deleteCmsUrlList", param);
    }

    /*cmsUserAuth 관리자 페이지 유저 관리*/
    public void cmsUserAuthAdd(Map<String, Object> param){
      mapper.insert("cms.addCmsUserAuth", param);
    }
    public List<Map<String, Object>> cmsUserAuthSelect(Map<String, Object> param){
        return mapper.select("cms.selectCmsUserAuth", param);
    }
}
