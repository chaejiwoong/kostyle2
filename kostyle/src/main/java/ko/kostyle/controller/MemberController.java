package ko.kostyle.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ko.kostyle.dto.members.MemberUpdateDTO;
import ko.kostyle.service.MemberService;

import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;

    // 마이페이지 이동
    @GetMapping("/myPage")
    public String myPage(Model model) {
        model.addAttribute("member", memberService.getMyInfo());

        return "members/myPage";
    }

    // 회원 수정 폼
    @GetMapping
    public String updateMember() {
    	
    
        return "members/updateMember";
       
    }

    // 회원 수정
    @PutMapping
    @ResponseBody
    public String updateInfo(@Valid @RequestBody MemberUpdateDTO dto) {
        memberService.updateInfo(dto);

        return "ok";
    }

    // 회원 탈퇴
    @DeleteMapping
    @ResponseBody
    public String deleteMember() {
        log.info("delete member....");
        memberService.deleteMember();
        return "ok";
    }
}
