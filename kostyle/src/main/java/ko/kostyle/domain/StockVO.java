package ko.kostyle.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class StockVO implements Serializable{
	private Long sno;
	private Long pno;
	private String p_size;
	private int amount;
}
