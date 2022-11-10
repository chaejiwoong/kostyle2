package ko.kostyle.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ProductFilterDTO {

    private int pageNum;
    private int amount;

    private String type;
    private String keyword;
    private String filter;
    
    private String sort;
    private int pcno;
    private int scno;
    
    public ProductFilterDTO() {
    }

    public ProductFilterDTO(Criteria cri, int pcno, int scno) {
    	System.out.println("pageNum = ");
        this.pageNum = cri.getPageNum();
        this.amount = cri.getAmount();
        this.keyword = cri.getKeyword();
        this.filter = cri.getFilter();
        this.type = cri.getType();
        this.pcno =pcno;
        this.scno=scno;
        this.sort = "";
    }

    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }
}
