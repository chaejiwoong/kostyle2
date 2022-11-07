package ko.kostyle.mapper;

import ko.kostyle.domain.AddressVO;

public interface AddressMapper {

	AddressVO findDefaultAddress(Long mno);
}
