package ko.kostyle.dto;

import java.util.Date;

import ko.kostyle.dto.AdminOrderDTO.AdminOrderDTOBuilder;
import ko.kostyle.dto.members.MemberDTO;
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
public class OrderCancelDTO {

	private Long ocno;
	
	private AdminProductDTO product;
	
	private String category;

	private String reason;
	
	private Date created_date;

}
