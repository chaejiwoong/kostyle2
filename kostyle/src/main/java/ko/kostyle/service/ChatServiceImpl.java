package ko.kostyle.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ko.kostyle.domain.ChatUserVO;
import ko.kostyle.dto.ChatDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.mapper.ChatUserMapper;
import ko.kostyle.mapper.QuestionMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatUserMapper mapper;
	
	@Override
	public List<ChatUserVO> chatLists(Criteria criteria) {
		// TODO Auto-generated method stub
		return mapper.getChatListWithPaging(criteria);
	}
	
	
	@Override
	public void insertChat(ChatDTO chatDTO) {
		mapper.insertChatKey(chatDTO);
	}

	@Override
	public int totalCount(ChatDTO chatDTO) {
		
		ChatUserVO userVO = new ChatUserVO();
		
		return mapper.chat_userTotalCount(userVO);
	}

	
//	@Override
//	public ChatDTO totalCount(ChatUserVO userVO) {
//		
//		return mapper.chat_userTotalCount(userVO);
//	}
	
	

}
