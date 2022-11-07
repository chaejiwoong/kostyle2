package ko.kostyle.service;

import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.dto.members.MemberUpdateDTO;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.mapper.OrderMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.members.MemberDTO;
import ko.kostyle.util.SecurityUtil;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
    private final MemberMapper mapper;
    private final OrderMapper orderMapper;
    private final PasswordEncoder passwordEncoder;

    // 현재 SecurityContext 에 있는 유저 정보 가져오기
    // 마이페이지에 출력할 회원의 이름, 포인트 추출
    @Override
    @Transactional(readOnly = true)
    public MemberDTO getMyInfo() {
        MemberVO vo = mapper.memberDetailById(SecurityUtil.getCurrentMemberId());
        if (vo == null) {
            throw new RuntimeException("로그인 유저 정보가 없습니다.");
        }
        MemberDTO dto = new MemberDTO();
        dto.setName(vo.getName());
        dto.setPoint(vo.getPoint());
        
        List<String> statusList = orderMapper.memberOrderStatus(SecurityUtil.getCurrentMemberId());
        for(String status : statusList) {
        	if(status.equals("상품준비중")) {
        		dto.setReady(dto.getReady() + 1);
        	}else if(status.equals("배송중")) {
        		dto.setDelivery(dto.getDelivery() + 1);
        	}else {
        		dto.setDone(dto.getDone() + 1);
        	}
        }
        
        return dto;
    }

    // 회원정보 수정
    @Override
    @Transactional
    public void updateInfo(MemberUpdateDTO dto) {
        MemberVO vo = new MemberVO();
        vo.setMno(SecurityUtil.getCurrentMemberId());
        vo.setName(dto.getName());
        vo.setPassword(passwordEncoder.encode(dto.getPassword()));

        mapper.updateInfo(vo);
    }


    // 회원 탈퇴
    @Override
    @Transactional
    public void deleteMember() {
        mapper.deleteMember(SecurityUtil.getCurrentMemberId());
    }

    // 회원 삭제
    @Override
    @Transactional
    public void deleteMember(Long mno) {
        mapper.deleteMember(mno);
    }


    //관리자 회원 리스트 조회
    @Override
    public List<MemberDTO> memberList(Criteria cri) {
        return mapper.memberList(cri).stream().map(MemberDTO::of)
                .collect(Collectors.toList());
    }

    //관리자 회원 조회
    @Override
    public MemberDTO memberDetail(Long mno) {

        return MemberDTO.of(mapper.memberDetailById(mno));
    }

    // 회원수정
    @Override
    public void updateMember(MemberDTO dto) {
        MemberVO vo = new MemberVO();
        vo.setMno(dto.getMno());
        vo.setPoint(dto.getPoint());
        vo.setAuthority(dto.getAuthority());
        System.out.println("vo = " + vo);

        mapper.updateMember(vo);
    }

    @Override
    public int getTotal(Criteria cri) {
        return mapper.getTotal(cri);
    }

}