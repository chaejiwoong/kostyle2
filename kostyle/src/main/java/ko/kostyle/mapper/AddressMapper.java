package ko.kostyle.mapper;

import java.util.List;

import ko.kostyle.domain.AddressVO;

public interface AddressMapper {

	// 기본 배송지 조회
	AddressVO findDefaultAddress(Long mno);
	
	List<AddressVO> addressList(Long mno);
	
	//배송지 추가
	void insertAddress(AddressVO vo);
	
	//배송지 상세
	AddressVO addressDetail(Long ano);
	
	// 기본배송지 해제
	void updateDefaultClear(Long mno);
	
	// 기본 배송지 설정
	void updateDefault(Long ano);
	//배송지 수정
	void updateAddress(AddressVO vo);
	
	// 배송지 삭제
	void deleteAddress(Long ano);
}
