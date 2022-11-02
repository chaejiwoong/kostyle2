package ko.kostyle.dto;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.dto.AdminOrderDTO.AdminOrderDTOBuilder;
import ko.kostyle.dto.members.MemberDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
@ToString
public class ImgDTO {

	private String filepath;
	private String filename;
	private String uuid;
	private boolean is_default;

	public static List<ImgDTO> of(List<AuctionImgVO> imgs) {
		List<ImgDTO> dtos = new ArrayList<ImgDTO>();
		
		for(AuctionImgVO img : imgs) {
			ImgDTO dto = ImgDTO.builder()
					.filepath(img.getFilepath())
					.filename(img.getFilename())
					.uuid(img.getUuid())
					.build();
			dtos.add(dto);
		}
		
		return dtos;

	}
}
