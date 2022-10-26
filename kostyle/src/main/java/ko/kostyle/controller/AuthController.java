package ko.kostyle.controller;

import ko.kostyle.dto.members.MemberChangeDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ko.kostyle.dto.members.MemberJoinDTO;
import ko.kostyle.service.AuthService;
import ko.kostyle.util.SecurityUtil;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequestMapping("/auth")
@RequiredArgsConstructor
@Log4j
public class AuthController {
    private final AuthService authService;
    private final HttpSession session;


    //회원가입 폼
    @GetMapping("/register")
    public String joinForm() {
        return "auth/register";
    }

    // 회원가입
    @PostMapping("/register")
    @ResponseBody
    public ResponseEntity<String> memberInsert(@Valid @RequestBody MemberJoinDTO memberJoinDto) {

        log.info("/auth/register........");
        log.info("dto : " + memberJoinDto);

        return ResponseEntity.ok(authService.memberInsert(memberJoinDto));
    }

    // 로그인 폼
    @GetMapping("/login")
    public String loginForm() {

        return "auth/login";
    }

    // 로그인
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<String> login(@RequestBody MemberJoinDTO memberJoinDto) {
    	
    	log.info(memberJoinDto);
//        TokenDTO tokenDto = authService.login(memberJoinDto);
        String email = authService.login(memberJoinDto);

        log.info("email = " + email);
        System.out.println("email = " + email);

        return ResponseEntity.ok(email);
    }
    
    @PostMapping("/logout")
    public ResponseEntity<String> logout(){
    	
    	log.info("logout...");
    	
    	session.invalidate();
    	return ResponseEntity.ok("ok");
    }

    @GetMapping("/emailAuth")
    @ResponseBody
    public String mailCheck(String email) {
        System.out.println("이메일 인증 요청이 들어옴");
        boolean isDuplicate = authService.memberDuplicateCheck(email);

        if (isDuplicate) {
            return "duplicate";
        }

        System.out.println("이메일 인증 이메일" + email);
        return authService.joinEmail(email);
    }

    @GetMapping("/findEmailAuth")
    @ResponseBody
    public String mailSend(String email, String name) {

        if (!authService.findPw(email, name)) {
            return "no";
        }

        return authService.joinEmail(email);
    }

    @GetMapping("/find")
    public String findIdAndPassword() {
        return "auth/find";
    }

    @PostMapping("/findId")
    @ResponseBody
    public String findId(@RequestBody MemberJoinDTO dto) {
        String email = authService.findId(dto);
        System.out.println("email = " + email);
        return email;
    }

    @PutMapping("/updatePw")
    @ResponseBody
    public String updatePw(@Valid @RequestBody MemberChangeDTO dto) {
        authService.updatePw(dto);

        return "ok";
    }
}
