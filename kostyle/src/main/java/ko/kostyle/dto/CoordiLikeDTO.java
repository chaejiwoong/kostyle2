package ko.kostyle.dto;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@NoArgsConstructor
public class CoordiLikeDTO {
	
	private Long clno;
	private Long cno;
	private Long mno;

	
	@Builder
	public CoordiLikeDTO(Long clno, Long cno, Long mno) {
		super();
		this.clno = clno;
		this.cno = cno;
		this.mno = mno;
	}
	
	
	
	

}
