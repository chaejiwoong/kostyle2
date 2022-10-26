package ko.kostyle.service;

import ko.kostyle.dto.members.MemberChangeDTO;
import ko.kostyle.dto.members.MemberJoinDTO;

public interface AuthService {

    public String memberInsert(MemberJoinDTO memberJoinDto);

//    public TokenDTO login(MemberJoinDTO memberJoinDto);
    public String login(MemberJoinDTO memberJoinDto);

    public void makeRandomNumber();

    public String joinEmail(String email);

    public void mailSend(String setFrom, String toMail, String title, String content);

    public boolean memberDuplicateCheck(String email);

    public String findId(MemberJoinDTO dto);

    public boolean findPw(String email, String name);

    public void updatePw(MemberChangeDTO dto);
}
