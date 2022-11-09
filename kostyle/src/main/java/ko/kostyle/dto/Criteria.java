package ko.kostyle.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

    private int pageNum;
    private int amount;

    private String type;
    private String keyword;
    private String filter;
    
    private String sort;
    
    public Criteria() {
        this(1, 10);
    }

    public Criteria(int pageNum, int amount) {
    	System.out.println("pageNum = ");
        this.pageNum = pageNum;
        this.amount = amount;
        this.sort = "";
    }

    public String[] getTypeArr() {
        return type == null? new String[] {}: type.split("");
    }
}
