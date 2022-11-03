package ko.kostyle.domain;

import java.io.Serializable;

import lombok.Data;

@Data
public class Product_ImgVO implements Serializable{
	
	private Long pino;
	private Long pno;
	private String filePath;
	private String fileName;
	private String uuid;

}
