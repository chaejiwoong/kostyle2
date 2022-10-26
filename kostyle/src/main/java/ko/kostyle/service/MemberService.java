package ko.kostyle.service;

import ko.kostyle.dto.members.MemberUpdateDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.members.MemberDTO;

import java.util.List;

public interface MemberService {

    public MemberDTO getMyInfo();

    public void updateInfo(MemberUpdateDTO dto);

    public void deleteMember();

    public void deleteMember(Long mno);

    public List<MemberDTO> memberList(Criteria cri);

    public MemberDTO memberDetail(Long mno);

    public void updateMember(MemberDTO dto);

    public int getTotal();
}
