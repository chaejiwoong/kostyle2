package ko.kostyle.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ko.kostyle.domain.BidVO;
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
public class BidDTO {

	private Long bno;
	private Long apno;
	private int rank;
	private String name;
	private String email;
	private int price;
	private Date created_date;
	
}
