package ko.kostyle.domain;

import java.io.Serializable;
import java.sql.Date;

import lombok.Data;

@Data
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
