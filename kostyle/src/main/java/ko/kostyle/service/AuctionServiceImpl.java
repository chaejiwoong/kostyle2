package ko.kostyle.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.AttentionAuctionVO;
import ko.kostyle.controller.AdminAuctionController;
import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.domain.AuctionVO;
import ko.kostyle.domain.BidVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.BidDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ImgDTO;
import ko.kostyle.mapper.AddressMapper;
import ko.kostyle.mapper.AttentionAuctionMapper;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.BidMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class AuctionServiceImpl implements AuctionService{

	private final AuctionMapper auctionMapper;
	private final AttentionAuctionMapper attentionMapper;
	private final MemberMapper memberMapper;
	private final BidMapper bidMapper;
	private final AddressMapper addressMapper;
	private final HttpSession session;
	
	// 상품 등록
	@Override
	@Transactional
	public void insertAuction(AuctionDTO dto) {
		
		log.info(dto);
		
		AuctionVO vo = AuctionVO.builder()
				.name(dto.getName())
				.start_price(dto.getStart_price())
				.best_bid_price(dto.getStart_price())
				.bid_unit(dto.getBid_unit())
				.build();
		
		auctionMapper.insertAuction(vo);
		List<ImgDTO> imgs = dto.getImgs();
		for(ImgDTO img : imgs) {
			AuctionImgVO imgVO = AuctionImgVO.builder()
					.apno(vo.getApno())
					.filename(img.getFilename())
					.filepath(img.getFilepath())
					.uuid(img.getUuid())
					.build();
			
			auctionMapper.insertAuctionImg(imgVO);
			
		}
	}

	// 전체 상품 리스트 가져오기
	@Override
	public List<AuctionDTO> getAuctionList(Criteria cri) {
		log.info("getAuctionList......");
		
		return getDtos(auctionMapper.auctionList(cri));
	}

	// 상품 상세 가져오기
	@Override
	public AuctionDTO getAuctionDetail(Long apno) {
		log.info("auction Detail Service.............");
		
		AuctionVO vo = auctionMapper.auctionDetail(apno);
		
		return AuctionDTO.builder()
				.apno(apno)
				.name(vo.getName())
				.start_price(vo.getStart_price())
				.best_bid_price(vo.getBest_bid_price())
				.bid_unit(vo.getBid_unit())
				.start_date(vo.getStart_date())
				.end_date(vo.getEnd_date())
				.imgs(ImgDTO.ofList(auctionMapper.auctionImgDetail(apno)))
				.build();
	}

	// 상품 업데이트
	@Override
	@Transactional
	public void updateAuction(AuctionDTO dto) {
		AuctionVO vo = new AuctionVO();
		Long apno = dto.getApno();
		vo.setApno(apno);
		vo.setName(dto.getName());
		vo.setBid_unit(dto.getBid_unit());

		auctionMapper.updateAuction(vo);
		
		auctionMapper.deleteAuctionImg(apno);
		
		List<ImgDTO> imgs = dto.getImgs();
		for(ImgDTO img : imgs) {
			AuctionImgVO imgVO = AuctionImgVO.builder()
					.apno(vo.getApno())
					.filename(img.getFilename())
					.filepath(img.getFilepath())
					.uuid(img.getUuid())
					.build();
			
			auctionMapper.insertAuctionImg(imgVO);
			
		}

	}

	// 상품 삭제
	@Override
	@Transactional
	public void deleteAuction(Long apno) {
		
		auctionMapper.deleteAuction(apno);
		
	}

	// 상품 갯수 구하기
	@Override
	public int getTotal(Criteria cri) {
		return auctionMapper.getTotal(cri);
	}

	// 현재 경매 진행중 리스트
	@Override
	public List<AuctionDTO> getAuctionProgressList(Criteria cri) {
		return getDtos(auctionMapper.auctionProgressList(cri));
	}

	// 마감임박 리스트 들고오기
	@Override
	public List<AuctionDTO> getAuctionDeadlineList(Criteria cri) {
		return getDtos(auctionMapper.auctionDeadlineList(cri));
	}
	
	// 회원이 입찰한 상품 목록 조회
	@Override
	public List<AuctionDTO> memberAuctionBidList() {
		
		log.info("memberAuctionBidList Service............");
		
		return getDtos(auctionMapper.memberAuctionBidList(SecurityUtil.getCurrentMemberId()));
	}
	
	private List<AuctionDTO> getDtos(List<AuctionVO> list){
		
		List<AuctionDTO> dtos = new ArrayList<AuctionDTO>();
		
		for(AuctionVO auction : list) {
			
			Long now = new Date().getTime();
			String status="";

			if(now < auction.getEnd_date().getTime()) {
				status = "진행";
			}else {
				status = "마감";
			}
			
			
			boolean isAttention = false;
			
			AttentionAuctionVO attention = AttentionAuctionVO.builder()
					.apno(auction.getApno())
					.mno(session.getAttribute("user")== null?0:((MemberVO)session.getAttribute("user")).getMno())
					.build();
		
			if(attentionMapper.existByAttention(attention) != null) {
				isAttention = true;
			}
			
			AuctionDTO dto = AuctionDTO.builder()
					.apno(auction.getApno())
					.name(auction.getName())
					.start_price(auction.getStart_price())
					.best_bid_price(auction.getBest_bid_price())
					.bid_unit(auction.getBid_unit())
					.imgs(ImgDTO.ofList(auctionMapper.auctionImgDetail(auction.getApno())))
					.status(status)
					.isAttention(isAttention)
					.start_date(auction.getStart_date())
					.end_date(auction.getEnd_date())
					.build();
			
			dtos.add(dto);
		}
		
		return dtos;
		
	}

	// 관심 경매 리스트 가져오기
	@Override
	public List<AuctionDTO> getAttentionList() {
		List<AuctionVO> list = auctionMapper.attentionList(SecurityUtil.getCurrentMemberId());
		List<AuctionDTO> dtos = getDtos(list);
		
		return dtos;
	}

	// 경매 입찰
	@Override
	@Transactional
	public void auctionBid(BidDTO dto) throws Exception {
		
		// 최초입찰인지 아닌지 검증(이전 회원의 포인트 반환 여부때문에)
		List<BidVO> bidList = bidMapper.bidList(dto.getApno());
		Long mno = SecurityUtil.getCurrentMemberId();
		MemberVO findMember = memberMapper.memberDetailById(mno);
		AddressVO address = addressMapper.findDefaultAddress(mno);

		// 기본배송지가 있는지 검증
		if(address == null) {
			throw new RuntimeException("기본배송지 등록 후 이용가능합니다.");
		}
		
		// 잔액이 충분한지 검증
		if(findMember.getPoint() < dto.getPrice()) {
			throw new RuntimeException("잔액이 부족합니다.");
		}	
		

		// 최초입찰이라면 해당 회원이 포인트가 있는지 조회
		if(bidList.size() == 0) {
			
			changeBestBidPrice(mno, dto);
			
		} else {
			BidVO bid = bidMapper.bestBidDetail(dto.getApno());
	
			log.info("bid : " + bid);
			log.info("mno : " + mno);
			// 최고입찰자가 중복입찰할 경우 리턴
			if(bid.getMno().equals(mno)) {
				throw new RuntimeException("중복입찰할 수 없습니다.");
			}
			// 전 최고입찰자의 포인트 환급
			memberMapper.updatePoint(bid.getMno(), (bid.getPrice()*-1));
			
			
			changeBestBidPrice(mno, dto);
		}
	}
	
	// 최고가 업데이트
	private void changeBestBidPrice(Long mno, BidDTO dto) {
		
		memberMapper.updatePoint(mno, dto.getPrice());
		
		AuctionVO auction = new AuctionVO();
		auction.setBest_bid_price(dto.getPrice());
		auction.setApno(dto.getApno());
		auctionMapper.updatePrice(auction);	// 최고입찰가 업데이트		
		
		BidVO bid = BidVO.builder()
				.apno(dto.getApno())
				.mno(mno)
				.price(dto.getPrice())
				.build();
		bidMapper.insertBid(bid);				// 입찰내역 추가
	}



}
