package ko.kostyle.service;

import java.util.List;

import ko.kostyle.dto.AddressDTO;

public interface AddressService {

	// 배송지 추가
	Long insertAddresse(AddressDTO dto);
	
	// 배송지 목록 조회
	List<AddressDTO> addressList();
	
	// 배송지 단일 조회
	AddressDTO addressDetail(Long ano);
	
	// 배송지 수정
	void updateAddress(AddressDTO dto);
	
	// 배송지 삭제
	void deleteAddress(Long ano);
	
	// 기본배송지 설정
	void updateDefault(Long ano);
	
	AddressDTO findDefaultAddress();
}
