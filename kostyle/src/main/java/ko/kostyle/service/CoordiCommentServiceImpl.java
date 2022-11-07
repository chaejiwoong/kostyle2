package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.CoordiCommentVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.CommentPageDTO;
import ko.kostyle.dto.CoordiCommentDTO;
import ko.kostyle.dto.CoordiDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.mapper.CoordiCommentMapper;
import ko.kostyle.mapper.CoordiMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CoordiCommentServiceImpl implements CoordiCommentService {

	@Autowired
	private CoordiCommentMapper coordiCommentMapper;
	
	@Autowired
	private CoordiMapper coordiMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	private CoordiCommentDTO commentDTO(CoordiCommentVO coordiCommentVO) {
		
		MemberVO memberVO = memberMapper.memberDetailById(coordiCommentVO.getMno());
		
		return CoordiCommentDTO.builder()
				.ccno(coordiCommentVO.getCcno())
				.email(memberVO.getEmail())
				.cno(coordiCommentVO.getCno())
				.content(coordiCommentVO.getContent())
				.date(coordiCommentVO.getLast_modified_date())
				.build();
		
	};

	//댓글 쓰기
	@Transactional
	@Override
	public int register(CoordiCommentDTO coordiCommentDTO) {	
		coordiMapper.updateCommentCount(coordiCommentDTO.getCno(), 1);
	
		CoordiCommentVO coordiCommentVO = CoordiCommentVO.builder()																				
																			.mno(SecurityUtil.getCurrentMemberId())
																			.cno(coordiCommentDTO.getCno())
																			.content(coordiCommentDTO.getContent())
																			.build();
		
		return coordiCommentMapper.insert(coordiCommentVO);
	}
	
	//댓글 1개 가져오기
	@Override
	public CoordiCommentDTO getComment(Long ccno) {
		return commentDTO(coordiCommentMapper.getComment(ccno)) ;
	}

	//댓글삭제
	@Transactional
	@Override
	public int remove(Long ccno) {	
		CoordiCommentVO coordiCommentVO =  coordiCommentMapper.getComment(ccno);
		coordiMapper.updateCommentCount(coordiCommentVO.getCno(), -1);
		
		return coordiCommentMapper.delete(ccno);
	}

	//댓글 목록 페이지 처리
	@Override
	public CommentPageDTO getListPage(Criteria cri, Long cno) {
		
		//방법1 (지웅씨 영업 기밀)
//		return new CommentPageDTO(coordiCommentMapper.getCountByCno(cno), 
//				coordiCommentMapper.getListWithPaging(cri, cno).stream()
//				.map(vo -> commentDTO(vo))
//				.collect(Collectors.toList())
//				);	
		
		List<CoordiCommentVO> listVO = coordiCommentMapper.getListWithPaging(cri, cno);
		List<CoordiCommentDTO> listDTO = new ArrayList<CoordiCommentDTO>();
		
		for(CoordiCommentVO commentVO : listVO) {
			listDTO.add(commentDTO(commentVO));
		}		
		return new CommentPageDTO(coordiCommentMapper.getCountByCno(cno), listDTO);
	}

	


	


}
