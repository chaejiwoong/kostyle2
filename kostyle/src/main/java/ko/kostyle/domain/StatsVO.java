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
public class StatsVO implements Serializable{
	
	private Long pno;
	private Long scno;
	private Long pcno;
	private int amount;
	

}
