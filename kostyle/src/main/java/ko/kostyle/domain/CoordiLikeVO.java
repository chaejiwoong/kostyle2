package ko.kostyle.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CoordiLikeVO {

	private Long clno;
	private	Long mno;
	private Long cno;

}
