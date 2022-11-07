package ko.kostyle.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AttentionAuctionVO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.AttentionAuctionMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
@Transactional(readOnly = true)
public class AttentionAuctionServiceImpl implements AttentionAuctionService{
	
	private final AttentionAuctionMapper attentionMapper;
	
	// 관심경매 등록
	@Override
	@Transactional
	public void updateAttention(Long apno) {
		AttentionAuctionVO vo = AttentionAuctionVO.builder()
				.mno(SecurityUtil.getCurrentMemberId())
				.apno(apno)
				.build();
		
		AttentionAuctionVO attention = attentionMapper.existByAttention(vo);
		if(attention != null) {
			attentionMapper.deleteAttention(vo);
		}else {
			attentionMapper.insertAttention(vo);
		}
	}

}
