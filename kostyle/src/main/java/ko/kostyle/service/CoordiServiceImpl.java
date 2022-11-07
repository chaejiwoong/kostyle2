package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ko.kostyle.domain.CoordiLikeVO;
import ko.kostyle.domain.CoordiVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.CommentPageDTO;
import ko.kostyle.dto.CoordiDTO;
import ko.kostyle.dto.CoordiLikeDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.mapper.CoordiLikeMapper;
import ko.kostyle.mapper.CoordiMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class CoordiServiceImpl implements CoordiService {
	
	private final CoordiMapper mapper;
	
	private final MemberMapper memberMapper;
	
	private final CoordiLikeMapper likeMapper;
	
	private final HttpSession session;
	

	private CoordiDTO coordiDTO(CoordiVO vo) {
		
		MemberVO memberVO = memberMapper.memberDetailById(vo.getMno());

		Long mno;
	
		
		try {
			mno = ((MemberVO) session.getAttribute("user")).getMno(); //SecurityUtil.user로 현재 회원 확인해서 mno 받으면 x
																													// 어나미머스 유저 오류 뜸
																													// 그리고 회원 아니면 넖포인트익셉션 뜨기에 예외처리 해야함
		} catch (Exception e) {
			mno = 0L;
		}

		CoordiLikeVO likeVO = CoordiLikeVO.builder()
																.mno(mno)
																.cno(vo.getCno())
																.build();
		
		return CoordiDTO.builder()
									.cno(vo.getCno())
									.email(memberVO.getEmail())
									.title(vo.getTitle())
									.content(vo.getContent())
									.c_count(vo.getC_count())
									.hitcount(vo.getHitcount())
									.lk_count(vo.getLk_count())
									.filepath(vo.getFilepath())
									.filename(vo.getFilename())
									.uuid(vo.getUuid())
									.created_date(vo.getCreated_date())				
									.isLike(likeMapper.findLike(likeVO) == 1? true : false)
									.build();
		
	}
	
	
	//코디 목록
	@Override
	public List<CoordiDTO> getList(Criteria cri) {	
		
			//기존 방법 -> 비효율
//		List<CoordiVO> listVO = mapper.getList(cri);
//		List<CoordiDTO> listDTO = new ArrayList<CoordiDTO>();
//		for(CoordiVO vo : listVO) {
//
//			listDTO.add(coordiDTO(vo));
//		}		
//		return listDTO;

		//지웅씨 영업기밀
		return mapper.getList(cri).stream()
				.map(vo -> coordiDTO(vo))
				.collect(Collectors.toList());	
	}

	
	//코디 상세 보기
	@Override
	public CoordiDTO getCoordi(Long cno) {
		CoordiVO coordiVO = mapper.getCoordi(cno);
		return coordiDTO(coordiVO);
	}

	//코디 글쓰기
	@Override
	public void register(CoordiDTO coordiDTO) {
		log.info("글쓰기 서비스 성공");
		
		CoordiVO coordiVO = CoordiVO.builder()
														.mno(SecurityUtil.getCurrentMemberId())
														.title(coordiDTO.getTitle())
														.content(coordiDTO.getContent())
														.filepath(coordiDTO.getFilepath())
														.filename(coordiDTO.getFilename())
														.uuid(coordiDTO.getUuid())
														.build();
		
		mapper.insertSelectKey(coordiVO);
	}

	//코디 글 수정
	@Override
	public void update(CoordiDTO coordiDTO) {
		
		CoordiVO coordiVO = CoordiVO.builder()
														.title(coordiDTO.getTitle())
														.content(coordiDTO.getTitle())
														.filepath(coordiDTO.getFilepath())
														.filename(coordiDTO.getFilename())
														.uuid(coordiDTO.getUuid())
														.build();
	}


	//코디 글 삭제
	@Override
	public void delete(Long cno) {
		mapper.delete(cno);
	}

	//댓글 수 처리
	@Override
	public void updateCommentCount(Long cno, int amount) {			
		mapper.updateCommentCount(cno, amount);
	}

	//조회수 증가
	@Override
	public void updateHitcount(Long cno) {
		mapper.updateHitcount(cno);
	}
	
	//좋아요 수 처리
	@Override
	public void updateLikeCount(Long cno) {
		mapper.updateLikeCoutnt(cno);		
	}
	
	//총 게시물 갯수
	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}


}
