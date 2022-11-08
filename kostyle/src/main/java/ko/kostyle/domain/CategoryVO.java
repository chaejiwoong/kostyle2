package ko.kostyle.domain;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryVO implements Serializable{
	
	private Long pcno;
	private Long scno;
	private String name;

}
