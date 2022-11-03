package ko.kostyle.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor


public class Product_ImgDTO {
	private String filePath;
	private String fileName;
	private String uuid;
	private Long pno;
	
	@Builder
	public Product_ImgDTO(String filePath, String fileName, String uuid, Long pno) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.uuid = uuid;
		this.pno = pno;
	}
	
	
	
}
