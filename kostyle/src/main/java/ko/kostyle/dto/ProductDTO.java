package ko.kostyle.dto;

import java.sql.Date;
import java.util.List;

import ko.kostyle.domain.Product_ImgVO;
import ko.kostyle.domain.StockVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
	
	private List<Product_ImgVO> imageList;
	
	private List<StockVO> stockList; 
	


}
