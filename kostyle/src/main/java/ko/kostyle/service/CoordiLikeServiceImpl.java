package ko.kostyle.service;

import org.springframework.stereotype.Service;

import ko.kostyle.domain.CoordiLikeVO;
import ko.kostyle.domain.CoordiVO;
import ko.kostyle.dto.CoordiLikeDTO;
import ko.kostyle.mapper.CoordiLikeMapper;
import ko.kostyle.mapper.CoordiMapper;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CoordiLikeServiceImpl implements CoordiLikeService {
	
	private final CoordiLikeMapper mapper;
	private final CoordiMapper coordiMapper;
	
	private final CoordiLikeVO likeVO(CoordiLikeDTO likeDTO) {
		return CoordiLikeVO.builder()
						.clno(likeDTO.getClno())
						.mno(likeDTO.getMno())
						.cno(likeDTO.getCno())
						.build();
	}

	//좋아요 여부 찾기
	@Override
	public int findLike(CoordiLikeDTO likeDTO) {
		return mapper.findLike(likeVO(likeDTO));
	}

	//좋아요 누르기
	@Override
	public void likeUp(CoordiLikeDTO likeDTO) {	
		mapper.insert(likeVO(likeDTO));
		coordiMapper.updateLikeCoutnt(likeVO(likeDTO).getCno());
	}

	//좋아요 취소
	@Override
	public void likeDown(CoordiLikeDTO likeDTO) {
		mapper.delete(likeVO(likeDTO));
		coordiMapper.updateLikeCoutnt(likeVO(likeDTO).getCno());
	}

}
