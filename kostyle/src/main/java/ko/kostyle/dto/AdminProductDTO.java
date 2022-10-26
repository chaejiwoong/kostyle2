package ko.kostyle.dto;

import ko.kostyle.dto.AdminOrderDetailDTO.AdminOrderDetailDTOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class AdminProductDTO {
	private Long pno;
	private String name;
}
