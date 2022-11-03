package ko.kostyle.dto;

import lombok.Data;

@Data
public class StockDTO {
	private Long sno;
	private Long pno;
	private String p_size;
	private int amount;
}
