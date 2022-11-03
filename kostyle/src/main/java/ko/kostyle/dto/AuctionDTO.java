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
public class AuctionDTO {
	
	private Long apno;
	private String name;
	private int start_price;
	private int best_bid_price;
	private int bid_unit;
	private Date start_date;
	private Date end_date;
	
	private List<ImgDTO> imgs;
	private MultipartFile uploadFile;
	
	@Builder
	public AuctionDTO(Long apno, String name, int start_price, int best_bid_price, int bid_unit, Date start_date,
			Date end_date, List<ImgDTO> imgs) {
		super();
		this.apno = apno;
		this.name = name;
		this.start_price = start_price;
		this.best_bid_price = best_bid_price;
		this.bid_unit = bid_unit;
		this.start_date = start_date;
		this.end_date = end_date;
		this.imgs = imgs;
	}
	
	
}
