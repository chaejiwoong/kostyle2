package ko.kostyle.dto;

import java.util.List;

import ko.kostyle.domain.ChatUserVO;
import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.QnaAjaxDTO.QnaAjaxDTOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class ChatDTO {
//	private ChatUserVO chatUserVO;
	
	private Long cuno;
	private Long member_id;
	private String status;
	private String chat_title;
	
	private int count;
	
}
