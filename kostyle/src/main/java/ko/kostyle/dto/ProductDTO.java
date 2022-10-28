package ko.kostyle.dto;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class ProductDTO  {
	
	private Long pno;
	private Long scno;
	private String name;
	private int price;
	private int hitCount;
	private int season;
	private String color;
	private String gender;
	private Date created_date;
	private Date last_modified_date;
	
	private List<StockDTO> stockList;

}
