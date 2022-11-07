package ko.kostyle.dto;

import java.io.Serializable;
import java.util.Date;

import ko.kostyle.dto.AddressDTO.AddressDTOBuilder;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class MemberDTO {
	private Long mno;
    private String email;
    private String password;
    private String name;
    private int birth;
    private char gender;
    private int point;
    private String authority;
    private Date created_date;
}
