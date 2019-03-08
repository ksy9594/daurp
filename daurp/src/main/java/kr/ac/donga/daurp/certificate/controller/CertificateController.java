package kr.ac.donga.daurp.certificate.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import kr.ac.donga.daurp.certificate.service.CertificateService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CertificateController {

    @Autowired
    CertificateService certificateService;

    Logger logger = LoggerFactory.getLogger(CertificateController.class);

    @RequestMapping(value = "/certificate/certificateEnroll", method = {RequestMethod.POST,RequestMethod.GET})
    public String connectionCertificate(Model model){

        List<Map<String, Object>> result = certificateService.certificateNumInfo();
        model.addAttribute("result", result.get(0).get("lecture_code"));

        return "tiles.certificate/certificateEnroll";
    }

    @RequestMapping(value="/certificate/certificateEnroll/add", method = RequestMethod.POST)
    public String addCandidate(@RequestParam Map<String, Object> addParam,
                               @RequestParam("IMAGE") MultipartFile file){


        String fileName = certificateService.fileUpload(file);
        addParam.put("IMAGE", fileName);

        logger.debug("Map<String, Object> addParam"+addParam);
        certificateService.addCandidate(addParam);

        return "redirect:/certificate/certificateEnroll";
    }

    @ResponseBody
    @RequestMapping(value = "/certificate/certificateEnroll/check")
    public Map<Object, Object> candidateCheck(@RequestParam (value="cerParam") List<String> param){
        logger.debug("Map<String, Object> userCheck = " + param);

        int count = 0;

        Map<Object, Object> result = new HashMap<>();
        count = certificateService.candidateInfo(param);
        logger.debug("count = " + count);

        result.put("cnt", count);
        logger.debug("cnt = " + result);

        return result;
    }
    @RequestMapping(value = "/certificate/certificateConfirm")
    public String confirm(Model model){
        List<Map<String, Object>> result = certificateService.certificateNumInfo_StudentInfo();

        model.addAttribute("cerNum",result);

        return "tiles.certificate/certificateConfirm";
    }

    @RequestMapping(value = "/certificate/certificateConfirm/confirm", method=RequestMethod.POST)
    public String studentConfirm(Model model, @RequestParam Map<String, Object> Param){
        logger.debug("Map<String, Object> Param ="+ Param);

        Map<String, Object> result = certificateService.receipt(Param);

        logger.debug("result           :" + result);

        if(result == null){
            return "/error/DataNotFound";
        } else {
            certificateService.receipt(Param);
            model.addAttribute("candidate", result);
            return "tiles.certificate/certificateStudentInfo";
        }
    }
    @RequestMapping(value="/regForm/certificateRegForm", method = RequestMethod.GET)
    public String regForm(){

        return "tiles.regForm/certificateRegForm";
    }

    @RequestMapping(value ="/certificate/certificateResultConfirm/resultConfirm")
    public String certificateResultConfirm(Model model,
                                           @RequestParam Map<String, Object> param){
        Map<String, Object> result = certificateService.receipt(param);

        if(result == null){
            return "/error/DataNotFound";
        } else {
            certificateService.receipt(param);
            model.addAttribute("result", result);
            return "tiles.certificate/certificateResultInfo";
        }
    }
}
