package ko.kostyle.dto;

import java.sql.Date;
import java.util.List;

import ko.kostyle.domain.ServiceCenterVo;
import ko.kostyle.dto.QuestionDTO.QuestionDTOBuilder;
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
public class QnaAjaxDTO {

	private List<ServiceCenterVo> qna;
	private PageDTO pageMaker;
}
