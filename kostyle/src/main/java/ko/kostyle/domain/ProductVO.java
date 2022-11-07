package ko.kostyle.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductVO implements Serializable{
	
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
	
	

}
