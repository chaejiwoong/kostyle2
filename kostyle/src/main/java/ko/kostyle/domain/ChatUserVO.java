package ko.kostyle.domain;

import lombok.Data;

@Data
public class ChatUserVO  extends MemberVO{
	private Long cuno;
	private Long mno;
	private String status;
	private String chat_title;
	
	private MemberVO memberVO;
}
