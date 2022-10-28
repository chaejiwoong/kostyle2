package ko.kostyle.domain;

import lombok.Data;

@Data
public class StockVO {
	private Long sno;
	private Long pno;
	private String p_size;
	private int amount;
}
