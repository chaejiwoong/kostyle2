package ko.kostyle.dto.members;

import ko.kostyle.domain.MemberVO;
import lombok.*;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.validation.constraints.*;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Setter
public class MemberJoinDTO {


    private String email;

    @NotEmpty(message = "이름은 필수 입력 값입니다.")
    @Pattern(regexp = "^[ㄱ-ㅎ가-힣a-z0-9-_]{2,10}$", message = "이름은 특수문자를 제외한 2~10자리")
    private String name;

    @NotNull
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,20}",
            message = "영문,숫자,특수문자가 포함된 8자 ~ 20자리")
    private String password;

    private char gender;

    @NotNull    // 숫자 타입에는 NOT NULL 사용
    @Pattern(regexp ="[0-9]{6}$", message = "생년월일 6자리를 입력해주세요.")
    private String birth;

    public MemberVO toMember(PasswordEncoder passwordEncoder) {
    	
        return MemberVO.builder()
                .email(email)
                .password(passwordEncoder.encode(password))
                .name(name)
                .gender(gender)
                .birth(Integer.parseInt(birth))
                .point(0)
                .authority("ROLE_USER")
                .build();
    }

    public UsernamePasswordAuthenticationToken toAuthentication() {
        return new UsernamePasswordAuthenticationToken(email, password);
    }
}
