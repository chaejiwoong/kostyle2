package ko.kostyle.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
//채팅방 생성될때
public class ChatUserVO {
	private Long cuno;
	private Long member_id;
	private String status;
	private String chat_title;
	
}
