package kr.ac.donga.daurp.certificate.service;

import kr.ac.donga.daurp.util.ExcelRead;
import kr.ac.donga.daurp.util.ExcelReadOption;
import ngel.core.service.AbstractCommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CertificateService extends AbstractCommonService {

    public static final String filePath = "D:\\upload\\";

    Logger logger = LoggerFactory.getLogger(CertificateService.class);

    public void addCandidate(Map<String, Object> param){

        mapper.insert("addCandidate", param);
    }
    public Map<String, Object> receipt(Map<String, Object> param){

        logger.info("Param : " + param.toString());

        Map<String, Object> candidate = mapper.get("Certificate.receiptCandidate", param);

        return candidate;
    }
    public int candidateInfo(List<String> param){

        Map<String, Object> map = new HashMap<>();

        map.put("TEL", param.get(0));

        logger.info("Service Result -------------" + map);

        int result = mapper.get("Certificate.memberCheck", map);
        logger.info("Service Result2 -------------" + result);

        return result;
    }
    public List<Map<String, Object>> certificateNumInfo(){

        List<Map<String, Object>> result = mapper.select("Certificate.certificateNumInfo");
        return result;
    }
    public List<Map<String, Object>> certificateNumInfo_StudentInfo(){

        List<Map<String, Object>> result = mapper.select("Certificate.certificateNumInfo_StudentInfo");

        return result;
    }

    public String fileUpload(MultipartFile multipartFile) {
        String url = null;

        try{
            String originFilename = multipartFile.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."));

            Long size = multipartFile.getSize();

            String saveFileName = genSaveFileName(extName);
            writeFile(multipartFile, saveFileName);
            url = saveFileName;

        } catch (IOException e){
            throw new RuntimeException(e);
        }
        return url;
    }
    // 현재 시간을 기준으로 파일 이름 생성
    public String genSaveFileName(String extName) {
        String fileName = "";

        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);

        fileName += extName;

        return fileName;
    }
    // 파일을 실제로 write 하는 메서드
    private boolean writeFile(MultipartFile multipartFile, String saveFileName)
            throws IOException{
        boolean result = false;

        byte[] data = multipartFile.getBytes();
        FileOutputStream fos = new FileOutputStream(filePath + "/" + saveFileName);
        fos.write(data);
        fos.close();

        return result;
    }

}
