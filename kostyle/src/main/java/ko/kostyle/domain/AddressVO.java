package ko.kostyle.domain;

import java.io.Serializable;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class AddressVO implements Serializable{

    private Long ano;
    private Long mno;
    private String address;
    private String tel;
    private String name;
    private boolean is_default;

}
