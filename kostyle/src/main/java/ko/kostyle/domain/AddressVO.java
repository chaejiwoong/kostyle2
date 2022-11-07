package ko.kostyle.domain;

import java.io.Serializable;

import ko.kostyle.dto.AddressDTO;
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
    private String recipient;
    
    public static AddressVO toVO(AddressDTO dto) {
    	return AddressVO.builder()
                .ano(dto.getAno())
                .address(dto.getAddress())
                .tel(dto.getTel())
                .name(dto.getName())
                .is_default(dto.is_default())
                .recipient(dto.getRecipient())
                .build();
    }

}
