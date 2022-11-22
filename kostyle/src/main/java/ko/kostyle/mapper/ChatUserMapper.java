package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.ChatUserVO;
import ko.kostyle.dto.ChatDTO;
import ko.kostyle.dto.Criteria;

public interface ChatUserMapper {
	
	public List<ChatUserVO> getChatListWithPaging(Criteria criteria);
	
	public void insertChatKey(ChatDTO chatDTO);
	public int chat_userTotalCount(ChatUserVO chatUserVO);
}
