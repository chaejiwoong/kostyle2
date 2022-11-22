package ko.kostyle.service;

import java.util.List;

import ko.kostyle.domain.ChatUserVO;
import ko.kostyle.dto.ChatDTO;
import ko.kostyle.dto.Criteria;

public interface ChatService {
	
	public List<ChatUserVO> chatLists(Criteria criteria);
	
//	유저가 상담 버튼 누르면 생성
	public void insertChat(ChatDTO chatDTO);
//	채팅방 곗수
	public int totalCount(ChatDTO chatDTO);

}
