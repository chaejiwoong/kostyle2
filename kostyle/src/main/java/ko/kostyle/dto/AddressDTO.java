package ko.kostyle.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import ko.kostyle.domain.AddressVO;
import lombok.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
@ToString
public class AddressDTO {

    private Long ano;
    private Long mno;
    private String address;
    private String tel;
    private String name;
    @JsonProperty(value = "is_default")
    private boolean is_default;
    private String recipient;


    public static AddressDTO of(AddressVO address) {
    	return AddressDTO.builder()
                .ano(address.getAno())
                .mno(address.getMno())
                .address(address.getAddress())
                .tel(address.getTel())
                .name(address.getName())
                .is_default(address.is_default())
                .recipient(address.getRecipient())
                .build();
    }
}
