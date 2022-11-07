package ko.kostyle.domain;

import lombok.Data;

import java.io.Serializable;
import java.sql.Date;

@Data
public class ServiceCenterVo {
    private Long nno;
    private String title;
    private String content;
    private String category;
    private Date created_date;
}
