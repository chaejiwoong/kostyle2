package ko.kostyle.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.dto.AddressDTO;
import ko.kostyle.mapper.AddressMapper;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.AuctionMapper;
import ko.kostyle.mapper.MemberMapper;
import ko.kostyle.mapper.WinningBidMapper;
import ko.kostyle.util.SecurityUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
@Transactional(readOnly = true)
public class AddressServiceImpl implements AddressService{
	
	private final AddressMapper addressMapper;

	@Override
	@Transactional
	public void insertAddresse(AddressDTO dto) {
		log.info("insertAddress service........");
		
		log.info("dto : " +dto);
		
		AddressVO address = AddressVO.toVO(dto);
		address.setMno(SecurityUtil.getCurrentMemberId());
		
		if(address.is_default()) {
			addressMapper.updateDefaultClear(address.getMno());
		}
		
		addressMapper.insertAddress(address);
	}

	// 회원의 배송지 목록 조회
	@Override
	public List<AddressDTO> addressList() {
		log.info("addressList service........");
	
		return addressMapper.addressList(SecurityUtil.getCurrentMemberId()).stream()
				.map(AddressDTO::of)
				.collect(Collectors.toList());
	}

	// 배송지 단일 조회
	@Override
	public AddressDTO addressDetail(Long ano) {
		log.info("addressDetail service........");
		return AddressDTO.of(addressMapper.addressDetail(ano));
	}

	// 배송지 수정
	@Override
	@Transactional
	public void updateAddress(AddressDTO dto) {
		log.info("updateAddress service........");
		
		log.info("dto : " +dto);
		
		AddressVO address = AddressVO.toVO(dto);
		address.setMno(SecurityUtil.getCurrentMemberId());
		
		if(address.is_default()) {
			addressMapper.updateDefaultClear(address.getMno());
		}
		
		addressMapper.updateAddress(address);		
		
	}
	
	// 기본 배송지 설정
	@Override
	@Transactional
	public void updateDefault(Long ano) {
		log.info("updateDefault service........");
		
		addressMapper.updateDefaultClear(SecurityUtil.getCurrentMemberId());

		addressMapper.updateDefault(ano);	
	}
	

	// 배송지 삭제
	@Override
	public void deleteAddress(Long ano) {
		log.info("deleteAddress service........");
		
		addressMapper.deleteAddress(ano);
	}



	
}
