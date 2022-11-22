package ko.kostyle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ko.kostyle.domain.ChatUserVO;
import ko.kostyle.dto.ChatDTO;
import ko.kostyle.service.ChatService;
import ko.kostyle.service.QuestionService;
import ko.kostyle.service.ServiceCenterService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/customerCenter/*")
@AllArgsConstructor
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@PostMapping("/register")
	@ResponseBody
	public ChatDTO postChatRoom( ChatUserVO chatUserVO, ChatDTO chatDTO, @RequestParam(value = "chat_title") String chat_title, @RequestParam( value = "member_id") Long member_id, Model model) {
		log.info("1대1채팅: " + chatUserVO);
		log.info("채팅이름" + chat_title);
		log.info("멤버아이디" + member_id);
		log.info("member" + chatUserVO);
		
//		chatService.totalCount(chatUserVO);
//		ChatUserVO chatInsert = chatService.insertChat(chatUserVO);
//		chatService.insertChat(chatUserVO);
//		int chatCount = chatService.totalCount(chatUserVO);

//		ChatDTO chatCount = chatService.totalCount(chatDTO.getCount());
		
		log.info("확인"+ chatService.totalCount(chatDTO));
//		log.info("get없는거" + chatService.insertChat(chatDTO));
//		log.info("get없는거" + chatService.insertChat(chatDTO));
//		
//
//		log.info("get있는거" + chatService.insertChat(chatDTO).getChat_title());
//		log.info("get있는거" + chatService.insertChat(chatDTO).getMember_id());
		
		
		
		chatDTO.setMember_id(member_id);
//		chatDTO.setChat_title(chatService.insertChat(chatUserVO.getChat_title()));
		chatDTO.setCount(chatService.totalCount(chatDTO));
		chatService.insertChat(chatDTO);
		return chatDTO;
		
//		rttr.addFlashAttribute("result", chatService.insertChat(chatUserVO));
//		return "redirect:/customerCenter/register";
	}

}
