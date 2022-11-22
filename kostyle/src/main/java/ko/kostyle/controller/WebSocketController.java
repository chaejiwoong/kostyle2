package ko.kostyle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ko.kostyle.service.ChatService;
import ko.kostyle.service.QuestionService;
import ko.kostyle.service.ServiceCenterService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/ex/*")
@AllArgsConstructor
public class WebSocketController {
	
	@GetMapping("/echo")
	public void Socket() {
		log.info("소켓 열림");
	}
}
