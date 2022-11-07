package ko.kostyle.mapper;


import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.Criteria;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

    MemberVO memberDetailByEmail(String email);

    MemberVO memberDetailById(Long id);

    void memberInsert(MemberVO vo);

    String findId(MemberVO vo);

    void updatePassword(MemberVO vo);

    void updateInfo(MemberVO vo);

    void deleteMember(Long mno);

    List<MemberVO> memberList(Criteria cri);

    void updateMember(MemberVO vo);

    int getTotal(Criteria cri);
    
    void updatePoint(@Param("mno") Long mno, @Param("point") int point);
}

