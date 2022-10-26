package ko.kostyle.dto;

import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class AddressDTO {

    private Long ano;
    private String address;
    private String tel;
    private String name;
    private boolean is_default;


}
