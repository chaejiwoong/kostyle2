package ko.kostyle.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.net.httpserver.Authenticator.Result;

import ko.kostyle.domain.AnswerVO;
import ko.kostyle.domain.QuestionVO;
import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.AnswerDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.service.QuestionService;
import ko.kostyle.service.ServiceCenterService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/customercenter/*")
@AllArgsConstructor
public class AdminCustomerCenterController {
	
	@Autowired
	private ServiceCenterService service;
	@Autowired
	private QuestionService service2;
	
	@GetMapping("/qnaList")
	public String getQnaList(@RequestParam(value = "category", required=false) String category, Model model) {
		model.addAttribute("qnaList", service.getList( category));
		return "/admin/customercenter/qnaList";
	}
	
	@GetMapping("/noticeList")
	public void getNoticeList(Criteria criteria , Model model) {
		int total = service.noticeTotal(criteria);
		log.info("어드민공지사항: " + service.getNoticeList(criteria));
		model.addAttribute("noticeList", service.getNoticeList(criteria));
		model.addAttribute("pageMaker", new PageDTO(criteria,total));
	}
	
	@GetMapping({"/insert", "/insertNotice"})
	public void getInsert(QuestionVO vo, Model model) {
		log.info("어드민 qna 작성페이지");
	}

	
	@GetMapping("/qndetail")
	public void detailQN(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria criteria, Model model) {
		log.info("Qn 상세보기");
        model.addAttribute("boarddetail", service.getNoticeDetail(nno));
	}
	@GetMapping("/noticedetail")
	public void detailNotice(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria criteria, Model model) {
		log.info("공지사항 상세보기");
        model.addAttribute("boarddetail", service.getNoticeDetail(nno));
	}

	
	
	@PostMapping("/insert")
	public String postInsert(RedirectAttributes rttr, ServiceCenterVo vo) {
		log.info("어드민 qna 보내는 페이지 : " + vo.getNno());
		service.insertAdminNotice(vo);
		rttr.addFlashAttribute("result", vo.getNno());
		
		return "redirect:/admin/customercenter/qnaList";
	}
	
	@PostMapping("/insertNotice")
	public String postNoticeInsert(RedirectAttributes rttr, ServiceCenterVo vo) {
		log.info("어드민 qna 보내는 페이지 : " + vo.getNno());
		service.insertAdminNotice(vo);
		rttr.addFlashAttribute("result", vo.getNno());
		
		return "redirect:/admin/customercenter/noticeList";
	}
	@PostMapping("/qndetail")
	public String postUpdate(ServiceCenterVo vo, RedirectAttributes rttr) {
		log.info("업데이트 페이지: " + vo);
		
		if (service.updateAdminNotice(vo)) {
			rttr.addFlashAttribute("result", "succes");
		}
		return "redirect:/admin/customercenter/qnaList";
		
	}
	@PostMapping("/noticedetail")
	public String postNoticeUpdate(ServiceCenterVo vo, @ModelAttribute("cri") Criteria criteria, RedirectAttributes rttr) {
		log.info("업데이트 페이지: " + vo);
		log.info(criteria);
		if (service.updateAdminNotice(vo)) {
			rttr.addFlashAttribute("result", "succes");
		}
		return "redirect:/admin/customercenter/noticeList?nno=" + vo.getNno() + "&pageNum=" + criteria.getPageNum() + "&amount=" + criteria.getAmount();
		
	}
	
	@PostMapping("qnaList")
	public String postDelete(@RequestParam("nno") Long nno, RedirectAttributes rttr) {
		log.info("삭제페이지: " + nno);
		
		if (service.removeAdminNotice(nno)) {
			rttr.addFlashAttribute("result", "succes");
		}
		return "redirect:/admin/customercenter/qnaList";
	}
	
	@PostMapping("noticeList")
	public String posNoticetDelete(@RequestParam("nno") Long nno, @ModelAttribute("cri") Criteria criteria, RedirectAttributes rttr) {
		log.info("삭제페이지: " + nno);
		
		if (service.removeAdminNotice(nno)) {
			rttr.addFlashAttribute("result", "succes");
		}
		return "redirect:/admin/customercenter/noticeList?pageNum=" + criteria.getPageNum() + "&amount=" + criteria.getAmount();
	}

//	문의 그리고 문의 답변
	
	@GetMapping("/inquiryList")
	public void getInquiryList( Criteria criteria, Model model, AnswerDTO answerDTO) {
//		AnswerDTO answerDTO = service2.answer2(null);
		
		List<QuestionVO> list = service2.getList(criteria);
		log.info("list확인" + list);
		for(QuestionVO vo : list) {
			AnswerDTO answer = (AnswerDTO) service2.checkReply(vo.getQno());
			log.info("answer: " + answer);
			if(answer != null) {
				vo.setAnswer("yes");
				log.info("답변 있음" + vo);
				model.addAttribute("check", vo);
			}
		}
		
		int total = service2.questionTotal(criteria);
		log.info("문의 리스트: " + service2.getList(criteria));
		model.addAttribute("registerList", service2.getList(criteria));
		model.addAttribute("pageMaker", new PageDTO(criteria,total));
	}
	
	@GetMapping("/insertInquiry")
	public void getInsertInquiry(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria criteria, Model model) {
		log.info("문의 답볍 등록");
		model.addAttribute("showList", service2.showQuestion(qno));
	}
	
	@PostMapping("/insertInquiry")
	public String postInquiry(RedirectAttributes rttr, AnswerVO vo, @RequestParam("qno") Long qno, @RequestParam("content") String content, @ModelAttribute("cri") Criteria criteria) {
		vo.setQno(qno);
		vo.setContent(content);
		log.info("어드민 문의 답변 페이지 답변 번호" + vo.getAsno());
		log.info("어드민 문의 답변 페이지 문의 번호" + vo.getQno());
		log.info("어드민 문의 답변 페이지 문의 번호" + vo.getContent());
		log.info("vo: " + vo);
		
		service2.register(vo, qno, content);
		rttr.addFlashAttribute("qno", vo);
		rttr.addFlashAttribute("result", vo.getContent());
		
		return "redirect:/admin/customercenter/inquiryList?qno=" + vo.getQno() + "&pageNum=" + criteria.getPageNum() + "&amount=" + criteria.getAmount();
	}
	
	@GetMapping("/answerdetail")
	public void getAnswer(@RequestParam("qno") Long qno, Model model, @ModelAttribute("cri") Criteria criteria) {
		model.addAttribute("list", service2.get(qno));
		model.addAttribute("showList", service2.showQuestion(qno));
	}
	
}
