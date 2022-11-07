package ko.kostyle.dto;

import java.util.List;

import ko.kostyle.domain.CoordiCommentVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class CommentPageDTO {
	
	private int c_count;
	private List<CoordiCommentDTO> list;

}
