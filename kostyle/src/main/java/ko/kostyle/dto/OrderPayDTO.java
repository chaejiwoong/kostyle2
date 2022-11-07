package ko.kostyle.dto;

import java.util.ArrayList;
import java.util.List;

import ko.kostyle.dto.OrderDetailDTO.OrderDetailDTOBuilder;
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
public class OrderPayDTO {
	
	private Long pno;
    private String p_size;
    private int amount;
    private int price;
    
    private List<OrderPayDTO> payList = new ArrayList<OrderPayDTO>();
}
