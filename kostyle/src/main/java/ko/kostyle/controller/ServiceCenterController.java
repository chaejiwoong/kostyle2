package ko.kostyle.controller;

//import ko.kostyle.domain.AjaxDAO;
import ko.kostyle.domain.Criteria;
import ko.kostyle.domain.PageDTO;
import ko.kostyle.service.ServiceCenterService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Log4j
@RequestMapping("/customerCenter/*")
@AllArgsConstructor
public class ServiceCenterController {

    private ServiceCenterService service;
//    private AjaxDAO dao;
    @GetMapping("/qna")
    public void getQna(Criteria criteria, Model model) {
        log.info("asdQ&N: " + criteria);
        int total = service.noticeTotal(criteria);
        model.addAttribute("qnaList", service.getList(criteria));
        model.addAttribute("pageMaker", new PageDTO(criteria,total));
    }
//    QNA 카테고리영역
//    @RequestMapping(value = "/qna/{category}")
//    public void purchase(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
//        try {
//            response.setContentType("text/plain");
//            response.setCharacterEncoding("UTF-8");
//
//            String category = dao.getCategory();
//
//
//        }catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//    QNA 카테고리영역 끝


    @GetMapping("/notice")
    public void getNotice(Criteria criteria, Model model) {
        int total = service.noticeTotal(criteria);
        model.addAttribute("noticeList", service.getNoticeList(criteria));
        model.addAttribute("pageMaker", new PageDTO(criteria,total));

        log.info("공지사항");
    }
    @GetMapping("/noticedetail")
    public void getnoticedetile(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria criteria, Model model) {
        log.info("공지사항 상세보기");
        model.addAttribute("boarddetail", service.getNoticeDetail(nno));
    }

    @GetMapping("/register")
    public void getRegister() {
        log.info("문의");
    }
}
