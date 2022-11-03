package ko.kostyle.controller;

import java.io.File;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/commons")
public class CommonController {
	
    @GetMapping("/display")
    @ResponseBody
    public ResponseEntity<byte[]> getFile(String fileName) {

        log.info("fileName: " + fileName);
        // 파라미터로 넘어온 파일경로와 서버의 경로를 합친 file 객체 생성 => 파일의 Full Path
        File file = new File("c:\\upload\\" + fileName);
        log.info("file : " + file);

        ResponseEntity<byte[]> result = null;

        try {
            // 헤더정보를 담기 위한 HttpHeaders 객체 생성
            HttpHeaders header = new HttpHeaders();

            // 헤더의 해당 파일의 MIME 타입을 Content-Type 으로 추가
            header.add("Content-Type", Files.probeContentType(file.toPath()));
            // ResponseEntity 에 해당 파일정보를 Byte 코드로 변환한 값, 헤더, 상태코드를 담아서 리턴
            result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

}
