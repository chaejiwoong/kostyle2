package ko.kostyle.dto.members;

import ko.kostyle.domain.MemberVO;
import lombok.*;

import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
public class MemberDTO {

    private Long mno;
    private String email;
    private String name;
    private int birth;
    private String gender;
    private int point;
    private String authority;
    private Date createdDate;



    public static MemberDTO of(MemberVO vo) {

        return MemberDTO.builder()
                .mno(vo.getMno())
                .email(vo.getEmail())
                .name(vo.getName())
                .birth(vo.getBirth())
                .gender(vo.getGender())
                .point(vo.getPoint())
                .authority(vo.getAuthority())
                .createdDate(vo.getCreated_date())
                .build();
    }


}