package ko.kostyle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AuctionImgVO;
import ko.kostyle.domain.AuctionVO;
import ko.kostyle.dto.AuctionDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.ImgDTO;
import ko.kostyle.mapper.AuctionMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class AuctionServiceImpl implements AuctionService{

	private final AuctionMapper auctionMapper;
	
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

	@Override
	public List<AuctionDTO> getAuctionList(Criteria cri) {
		log.info("getAuctionList......");
		
		List<AuctionVO> list = auctionMapper.auctionList(cri);
		List<AuctionDTO> dtos = new ArrayList<AuctionDTO>();
		
		for(AuctionVO auction : list) {
			
			AuctionDTO dto = AuctionDTO.builder()
					.apno(auction.getApno())
					.name(auction.getName())
					.start_price(auction.getStart_price())
					.best_bid_price(auction.getBest_bid_price())
					.bid_unit(auction.getBid_unit())
					.imgs(ImgDTO.of(auctionMapper.auctionImgDetail(auction.getApno())))
					.start_date(auction.getStart_date())
					.end_date(auction.getEnd_date())
					.build();
			
			dtos.add(dto);
		}
		
		return dtos;
	}

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
				.imgs(ImgDTO.of(auctionMapper.auctionImgDetail(apno)))
				.build();
	}

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

}
