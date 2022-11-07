package ko.kostyle.controller;

import ko.kostyle.dto.PageDTO;
import ko.kostyle.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.members.MemberDTO;

import java.util.List;

@Controller
@RequestMapping("/admin/members")
@RequiredArgsConstructor
@Log4j
public class AdminMemberController {

    private final MemberService memberService;

    // 회원목록
    @GetMapping
    public String memberList(Criteria cri, Model model) {

        List<MemberDTO> list = memberService.memberList(cri);

        model.addAttribute("list", list);
        int total = memberService.getTotal(cri);
        System.out.println("total = " + total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        log.info(cri);

        return "admin/memberList";
    }

    // 회원조회
    @GetMapping("/{mno}")
    public String memberDetail(@PathVariable Long mno, Model model) {

        model.addAttribute("member", memberService.memberDetail(mno));

        return "admin/memberDetail";
    }

    // 회원수정
    @PutMapping("/{mno}")
    @ResponseBody
    public String updateMember(@PathVariable Long mno, @RequestBody MemberDTO dto) {
        dto.setMno(mno);
        memberService.updateMember(dto);

        return "ok";
    }

    //회원 삭제
    @DeleteMapping("/{mno}")
    @ResponseBody
    public String deleteMemberByAdmin(@PathVariable Long mno) {
        memberService.deleteMember(mno);

        return "ok";
    }
}
