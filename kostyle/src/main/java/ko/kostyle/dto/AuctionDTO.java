package ko.kostyle.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ko.kostyle.dto.AddressDTO.AddressDTOBuilder;
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
@ToString
@Builder
public class AuctionDTO {
	
	private Long apno;
	private String name;
	private int start_price;
	private int best_bid_price;
	private int bid_unit;	
	private String status;
	private Date start_date;
	private Date end_date;
	private boolean isAttention;
	
	private List<ImgDTO> imgs;
	
	
}
