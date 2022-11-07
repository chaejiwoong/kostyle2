package ko.kostyle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ko.kostyle.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainPage {
	
	@GetMapping("/kostyle4u")
	public void Page() {
		log.info("메인");
	}
}
