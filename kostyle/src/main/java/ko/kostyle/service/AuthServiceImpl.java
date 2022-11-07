package ko.kostyle.service;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.members.MemberChangeDTO;
import ko.kostyle.dto.members.MemberJoinDTO;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import java.util.Random;

@Service
@RequiredArgsConstructor
@Slf4j
public class AuthServiceImpl implements AuthService{

    private final AuthenticationManagerBuilder authenticationManagerBuilder;
    private final PasswordEncoder passwordEncoder;
    private final MemberMapper memberMapper;
    private final JavaMailSenderImpl mailSender;
    private int authNumber;
    private final HttpSession session;

    @Override
    @Transactional
    public String memberInsert(MemberJoinDTO memberJoinDto) {
        log.info("" + memberJoinDto);
        MemberVO findMember = memberMapper.memberDetailByEmail(memberJoinDto.getEmail());
        log.info("" + findMember);
        if (findMember != null) {
            throw new RuntimeException("이미 가입되어 있는 유저입니다");
        }
        log.info("hello");
        MemberVO member = memberJoinDto.toMember(passwordEncoder);
        log.info("" + member);
        memberMapper.memberInsert(member);
        return member.getName();
    }

    @Override
    @Transactional
    public String login(MemberJoinDTO memberJoinDto){
        // 1. Login ID/PW 를 기반으로 AuthenticationToken 생성
        UsernamePasswordAuthenticationToken authenticationToken = memberJoinDto.toAuthentication();

        // 2. 실제로 검증 (사용자 비밀번호 체크) 이 이루어지는 부분
        //authenticate 메서드가 실행이 될 때 CustomUserDetailsService 에서 만들었던 loadUserByUsername 메서드가 실행됨
        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);

        SecurityContextHolder.getContext().setAuthentication(authentication);
        Long mno = SecurityUtil.getCurrentMemberId();
        MemberVO vo = memberMapper.memberDetailById(mno);
        session.setAttribute("user", vo);

        return memberJoinDto.getEmail();
    }

    // 난수발생
    @Override
    public void makeRandomNumber() {
        //난수의 범위 111111~999999
        Random r = new Random();
        int checkNum = r.nextInt(888888) + 111111;
        System.out.println("checkNum = " + checkNum);
        authNumber = checkNum;
    }

    @Override
    public String joinEmail(String email) {
        makeRandomNumber();
        String setFrom = "cowldnd2@gmail.com";  // 이메일 전송자
        String title = "회원 가입 인증 이메일"; // 이메일 제목
        String content = "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" +
                "인증 번호는 " + authNumber + "입니다." +
                "<br>" +
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";  // 이메일 내용 삽입

        mailSend(setFrom, email, title, content);
        return Integer.toString(authNumber);
    }

    @Override
    public void mailSend(String setFrom, String toMail, String title, String content) {
        MimeMessage message = mailSender.createMimeMessage();
        System.out.println(mailSender.getUsername());
        System.out.println(mailSender.getPassword());
        // true 매개값을 전달하면 multipart 형식의 메세지 전달이 가능.문자 인코딩 설정도 가능하다.
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            // true 전달 > html 형식으로 전송 , 작성하지 않으면 단순 텍스트로 전달.
            helper.setText(content,true);
            mailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }


    // 중복회원 체크
    @Override
    public boolean memberDuplicateCheck(String email) {
        MemberVO member = memberMapper.memberDetailByEmail(email);
        if (member != null) {
            return true;
        }

        return false;
    }
    @Override
    public String findId(MemberJoinDTO dto) {

        MemberVO vo = new MemberVO();
        vo.setName(dto.getName());
        vo.setBirth(Integer.parseInt(dto.getBirth()));
        return memberMapper.findId(vo);
    }
    @Override
    public boolean findPw(String email, String name) {
        MemberVO memberVO = memberMapper.memberDetailByEmail(email);
        return memberVO.getName().equals(name); // 해당 이메일 회원의 이름과 이름이 일치하면 true
    }
    @Override
    public void updatePw(MemberChangeDTO dto) {
        MemberVO vo = new MemberVO();
        vo.setEmail(dto.getEmail());
        vo.setPassword(passwordEncoder.encode(dto.getPassword()));

        System.out.println("vo = " + vo);
        memberMapper.updatePassword(vo);
    }
}