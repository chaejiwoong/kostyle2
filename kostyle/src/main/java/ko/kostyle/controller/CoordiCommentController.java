package ko.kostyle.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ko.kostyle.domain.CoordiCommentVO;
import ko.kostyle.dto.CommentPageDTO;
import ko.kostyle.dto.CoordiCommentDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.service.CoordiCommentService;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/coordiComments")
@Log4j
public class CoordiCommentController {
	
	@Autowired
	CoordiCommentService service;	
	
	//댓글 목록 페이지 처리
	@GetMapping
	public CommentPageDTO list(@RequestParam("cno") Long cno ,@RequestParam("page") int page) {
		log.info("댓글목록 페이지처리......" + cno);
		Criteria cri = new Criteria(page, 5);

		//service.getListPage(cri, cno).getC_count();
		
		return service.getListPage(cri, cno);
	}
	
	
	//댓글 1개 조회
	@GetMapping("/getComment")
	public String getComment(@PathVariable("ccno") Long ccno, Model model) {
		log.info("댓글 1개 조회....." + ccno);
		model.addAttribute("coordiComment", service.getComment(ccno));
		return "ok";
	}
	
	
	//댓글 등록
	//@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String write(@RequestBody CoordiCommentDTO commentDTO ) {
		
		log.info("coordiCommentDTO....: " + commentDTO);
		log.info("댓글 등록 글번호: " + commentDTO.getCno());
		
		service.register(commentDTO);
		
		return "ok";
	}
	
	
	//댓글 삭제
	@PreAuthorize("isAuthenticated()")
	@DeleteMapping("/{ccno}")
	public String remove(@PathVariable("ccno") Long ccno) {
		
		log.info("commentRemove 해당 댓글 번호.............." + ccno);
		service.remove(ccno);
		
		return "/redirect:/pages/{cno}/{page}";
	}
	

	
	
	
	
	
}
