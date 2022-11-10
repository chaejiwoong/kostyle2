package ko.kostyle.controller;

import ko.kostyle.domain.QuestionVO;
import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.dto.QnaAjaxDTO;
import ko.kostyle.service.ChatService;
import ko.kostyle.service.QuestionService;

//import ko.kostyle.domain.AjaxDAO;

import ko.kostyle.service.ServiceCenterService;
import ko.kostyle.util.SecurityUtil;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Log4j
@RequestMapping("/customerCenter/*")
@AllArgsConstructor
public class ServiceCenterController {

    private ServiceCenterService service;
    private QuestionService service2;
//    private ChatService chatService;
//  QNA 카테고리영역
//    private AjaxDAO dao;
    @GetMapping("/qna")
    public String getQna(@RequestParam(value = "category", required=false) String category, Model model) {
        model.addAttribute("qnaList", service.getList( category));
        
        return "/customerCenter/qna";
    }
//    고객센터 구매, 판매 
    @GetMapping("/qnaPart")
    @ResponseBody
    public QnaAjaxDTO getAjax(@RequestParam(value = "category", required=false) String category, Model model) {
        log.info("category:  " + category);
        QnaAjaxDTO dto = new QnaAjaxDTO();
        dto.setQna(service.getAjaxList(category));
        
        return dto;
    }

//    QNA 카테고리영역 끝

// 공지사항 영역
    @GetMapping("/notice")
    public void getNotice(Criteria criteria, Model model) {
        int total = service.noticeTotal(criteria);
        log.info("계수:"+total);
        model.addAttribute("noticeList", service.getNoticeList(criteria));
        model.addAttribute("pageMaker", new PageDTO(criteria,total));

        log.info("공지사항");
    }
    
    @GetMapping("/noticedetail")
    public void getnoticedetile(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria criteria, Model model) {
        log.info("공지사항 상세보기");
        model.addAttribute("boarddetail", service.getNoticeDetail(nno));
    }

    // 로그인
    @GetMapping("/register")
    public void getRegister(Criteria criteria, Model model) {
    	int total = service2.questionTotal(criteria);
    	log.info("계수:"+total);
        log.info("문의");
        model.addAttribute("registerList", service2.getList(criteria));
        model.addAttribute("pageMaker", new PageDTO(criteria, total));
//        model.addAttribute("name", service2.getname());
    }
    
    // 로그인
    @GetMapping("/answerdetail")
	public void getAnswer(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria criteria, Model model) {
		model.addAttribute("list", service2.get(qno));
		model.addAttribute("showList", service2.showQuestion(qno));
	}
//    @PostMapping("/register/{chat-title}")
//    @ResponseBody
//    public void postChat(@RequestParam() Model model)
//    
    
    @GetMapping("/insert")
    public void getInsert(QuestionVO vo, Model model) {
    	log.info("문의 작성:");
        Long mno = SecurityUtil.getCurrentMemberId();
    }
    
    @PostMapping("/insert")
    public String postinsert(QuestionVO vo, RedirectAttributes rttr) {
        log.info("insert......................" + vo);
        Long mno = SecurityUtil.getCurrentMemberId();
        vo.setMno(mno);
//        로그인 한사람에 mno가나옴
        service2.insert(vo);
        rttr.addFlashAttribute("result", vo.getQno());
        return "redirect:/customerCenter/register";
    }
    
    
    
}
