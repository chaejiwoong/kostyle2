package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import ko.kostyle.domain.AuctionVO;
import ko.kostyle.domain.BidVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.BidDTO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.BidMapper;
import ko.kostyle.mapper.DeliveryMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RequiredArgsConstructor
@Service
public class BidServiceImpl implements BidService {

	private final BidMapper bidMapper;
	private final AuctionMapper auctionMapper;
	private final MemberMapper memberMapper;

	// 회원의 입찰 내역 가져오기
	@Override
	public List<BidDTO> bidHistoryList(Long apno) {

		log.info("bidHistoryList Service.........");

		return toDtos(bidMapper.bidHistoryList(SecurityUtil.getCurrentMemberId(),apno));

	}

	// 상품의 경매입찰내역 가져오기
	@Override
	public List<BidDTO> getAuctionBidList(Long apno) {
		
		return toDtos(bidMapper.auctionBidList(apno));
	}
	
	private List<BidDTO> toDtos(List<BidVO> list){
		List<BidDTO> dtos = new ArrayList<BidDTO>();
		int rank = 1;
		for (BidVO bid : list) {
			AuctionVO auction = auctionMapper.auctionDetail(bid.getApno());
			MemberVO member = memberMapper.memberDetailById(bid.getMno());
			
			BidDTO dto = BidDTO.builder()
					.name(auction.getName())
					.apno(bid.getApno())
					.rank(rank++)
					.email(member.getEmail())
					.price(bid.getPrice())
					.created_date(bid.getCreated_date())
					.build();
			
			dtos.add(dto);
		}

		return dtos;
		
	}

}
