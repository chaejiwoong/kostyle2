package ko.kostyle.config;

import ko.kostyle.domain.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ko.kostyle.mapper.MemberMapper;


import javax.servlet.http.HttpSession;
import java.util.Collections;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {

    private final MemberMapper memberMapper;
    private final HttpSession session;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        MemberVO member = memberMapper.memberDetailByEmail(email);
        if (member == null) {
            throw new UsernameNotFoundException(email + " -> 데이터베이스에서 찾을 수 없습니다.");
        }

        return this.createUserDetails(member);

    }

    // DB 에 User 값이 존재한다면 UserDetails 객체로 만들어서 리턴
    private UserDetails createUserDetails(MemberVO member) {
        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority(member.getAuthority());

        User user = new User(
                String.valueOf(member.getMno()),
                member.getPassword(),
                Collections.singleton(grantedAuthority)
        );
        return user;
    }
}