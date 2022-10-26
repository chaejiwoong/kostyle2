package ko.kostyle.domain;

import lombok.*;

import java.io.Serializable;
import java.util.Date;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class MemberVO implements Serializable {

    private Long mno;
    private String email;
    private String password;
    private String name;
    private int birth;
    private char gender;
    private int point;
    private String authority;
    private Date created_date;

    public MemberVO(String email, String password,String name, int birth, char gender, int point, String authority, String introduce) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.gender = gender;
        this.birth = birth;
        this.point = point;
        this.authority = authority;
    }
}
