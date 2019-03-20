package kr.ac.donga.daurp.cms.controller;

import egovframework.rte.fdl.security.userdetails.EgovUserDetails;
import kr.ac.donga.daurp.cms.service.CmsService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class CmsController {

    @Autowired
    CmsService cmsService;

    Logger logger = LoggerFactory.getLogger(CmsController.class);

    @RequestMapping(value="/cms/isDespoitChk")
    public String excelUpload(Model model){

        List<Object> list = cmsService.certificateUserInfo();

        model.addAttribute("list", list);

        return "tiles.cms/isDespoitChk";
    }

    @RequestMapping(value = "/cms/certificateResult")
    public String certificateResult(Model model){

        List<Object> list = cmsService.certificateUserInfo();

        model.addAttribute("list", list);

        return "tiles.cms/certificateResult";
    }

    @RequestMapping(value = "/cms/isDespoitChk/excelUpload", method = RequestMethod.POST)
    public String excelUpload(MultipartHttpServletRequest request) throws Exception{
        MultipartFile excelFile = request.getFile("excelFile");
        logger.debug("엑셀 파일 업로드 컨트롤러");
        if(excelFile == null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀 파일을 선택해주세요");
        }
        File destFile = new File("D://"+excelFile.getOriginalFilename());
        try{
            excelFile.transferTo(destFile);
        } catch (IllegalStateException | IOException e){
            throw new RuntimeException(e.getMessage(), e);
        }
        cmsService.excelUpload(destFile);

        return "redirect:/cms/isDespoitChk";
    }

    @RequestMapping(value = "/cms/cmsCandidate")
    public String lectureStudentInfo(Model model){

        List<Object> list = cmsService.lectureStudentInfo();

        model.addAttribute("list", list);

        return "tiles.cms/cmsCandidate";
    }

    @RequestMapping(value="/cms/cmsAttendChk", method = RequestMethod.GET)
    public String cmsAttendChk(Model model, @RequestParam Map<String, Object> param){

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String sysdate = formatter.format(date);

        Map<String, Object> result = new HashMap<>();

        result.put("attndDate", sysdate);

        List<Object> list = cmsService.cmsAttendChk(param);

        model.addAttribute("list", list);
        model.addAttribute("params", param);

        return "tiles.cms/cmsAttendChk";
    }

    @RequestMapping(value = "/cms/cmsAttendChk/degree", method = RequestMethod.GET)
    public String cmsAttendDegree(Model model, @RequestParam Map<String, Object> param){

        logger.debug("PARAM ----------------"+ param);

        List<Object> list = cmsService.cmsAttendChk(param);

        model.addAttribute("list", list);

        return "tiles.cms/cmsAttendChk";
    }

    @RequestMapping(value="/cms/lecture_name")
    public String cmsLectureReg(){
        return "tiles.cms/lecture_name";
    }

    @RequestMapping(value="/cms/lecture_name/add", method = RequestMethod.POST)
    public String cmsLectureRegAdd(@RequestParam Map<String, Object> param){

        String lecture_code = "";
        Calendar calendar = Calendar.getInstance();
        lecture_code += calendar.get(Calendar.YEAR);
        lecture_code += calendar.get(Calendar.MONTH);
        lecture_code += calendar.get(Calendar.SECOND);
        lecture_code += calendar.get(Calendar.MILLISECOND);

        logger.debug("PARAM ============" + param);
        param.put("lecture_code", lecture_code);

        cmsService.addLecture(param);

        return "redirect:/cms/lecture_name";
    }

    @RequestMapping(value = "/cms/lecture_subject", method = RequestMethod.GET)
    public String cmsSubjectReg(Model model, @RequestParam Map<String, Object> param){

        String subjectCode = "";
        Calendar calendar = Calendar.getInstance();
        subjectCode += calendar.get(Calendar.YEAR);
        subjectCode += calendar.get(Calendar.MONTH);
        subjectCode += calendar.get(Calendar.SECOND);
        subjectCode += calendar.get(Calendar.MILLISECOND);

        logger.debug("PARAM----------------"+param);
        param.put("subjectCode", subjectCode);

        cmsService.addSubject(param);

        return "tiles.cms/lecture_subject";
    }

    @RequestMapping(value="/cms/certificate_degreeReg", method = RequestMethod.GET)
    public String cmsCerDegreeReg(@RequestParam Map<String, Object> param){

        String cer_number = "";
        Calendar calendar = Calendar.getInstance();
        cer_number += calendar.get(Calendar.YEAR);
        cer_number += calendar.get(Calendar.MONTH);
        cer_number += calendar.get(Calendar.SECOND);
        cer_number += calendar.get(Calendar.MILLISECOND);

        param.put("cer_number", cer_number);
        cmsService.cmsaddCertificateDegree(param);

        return "tiles.cms/certificate_degreeReg";
    }

    /*회차 및 교육과목 관리*/
    @RequestMapping(value="/cms/lectureManager")
    public String cmsLectureManage(){
        return "tiles.cms/lectureManager";
    }
    @ResponseBody
    @RequestMapping(value = "/cms/lectureManager/select")
    public List<Map<String, Object>> lectureManager(){
        return cmsService.lectureSelect();
    }
    @ResponseBody
    @RequestMapping(value="/cms/lectureManager/subjectSelect")
    public List<Map<String,Object>> subjectSelect(@RequestParam Map<String, Object> param){
        logger.debug("AuthCode      :    " + param);

        return cmsService.lectureSubjectSelect(param);
    }

    /*cmsAuthList 권한 리스트 관리*/
    @RequestMapping(value="/cms/cmsAuthList")
    public String cmsAuthList(){

        return "tiles.cms/cmsAuthList";
    }
    @ResponseBody
    @RequestMapping(value="/cms/cmsAuthList/add", method = RequestMethod.GET)
    public String cmsAuthListAdd(@RequestParam Map<String, Object> param){

        logger.debug("param  :    " + param);

        cmsService.cmsAuthListAdd(param);

        return "tiles.cms/cmsAuthList";
    }

    @ResponseBody
    @RequestMapping(value="/cms/cmsAuthList/select")
    public List<Map<String, Object>> cmsAuthListSelect(){
        return cmsService.cmsAuthListSelect();
    }

    @ResponseBody
    @RequestMapping(value="/cms/cmsAuthList/deleteSelRow")
    public int cmsAuthListDelete(@RequestParam List param){
        logger.debug("param       :       " + param);
        logger.debug("param       :       " + param.get(0));

        Map<String, Object> authCode = new HashMap<>();

        authCode.put("authCode", param.get(0));

         return cmsService.cmsAuthListDelete(authCode);
    }

    @ResponseBody
    @RequestMapping(value="/cms/cmsUrlList/delete")
    public int cmsUrlListDelete(@RequestParam List param){
        logger.debug("param       :       " + param);

        Map<String, Object> urlSeq = new HashMap<>();
        urlSeq.put("seq", param.get(0));

        return cmsService.cmsUrlListDelete(urlSeq);
    }
    /*cmsAuthList 권한 리스트 관리*/

    @RequestMapping(value = "/cms/cmsUrlList")
    public String cmsUrlList(){
        return "tiles.cms/cmsUrlList";
    }

    @ResponseBody
    @RequestMapping(value = "/cms/cmsUrlList/add")
    public String cmsUrlListAdd(@RequestParam Map<String, Object> param){
        logger.debug("param       :     "+param);

        cmsService.cmsUrlListAdd(param);

        return "tiles.cms/cmsUrlList";
    }

    @ResponseBody
    @RequestMapping(value="/cms/cmsUrlList/select")
    public List<Map<String, Object>> cmsUrlListSelect(@RequestParam Map<String, Object> param){
        logger.debug("AuthCode     " + param);

        return cmsService.cmsUrlListSelect(param);
    }

    /*cmsUserAuth 관리자 페이지 유저 관리*/
    @RequestMapping(value="/cms/cmsUserAuth")
    public String cmsUserAuth(){
        return "tiles.cms/cmsUserAuth";
    }
    @ResponseBody
    @RequestMapping(value = "/cms/cmsUserAuth/add")
    public String cmsUserAuthAdd(@RequestParam Map<String, Object> param){
        logger.debug("param      :     "   + param);

        cmsService.cmsUserAuthAdd(param);

        return "tiles.cms/cmsUserAuth";
    }

    @ResponseBody
    @RequestMapping(value = "/cms/cmsUserAuth/select")
    public List<Map<String, Object>> cmsUserAuthSelect(@RequestParam Map<String, Object> param){
        logger.debug("AuthCode        "   + param);

        return cmsService.cmsUserAuthSelect(param);
    }
}
