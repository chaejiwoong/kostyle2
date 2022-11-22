package ko.kostyle.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.dto.Criteria;

public interface OrderMapper {
	
	//주문 추가
	void insertOrder(OrderVO vo);
	
	
	//주문 상세 추가
	void insertOrderDetail(OrderDetailVO vo);
	
	
    List<OrderVO> orderList(@Param("cri")Criteria cri, @Param("filter")String filter, @Param("mno") Long mno);
    
    List<String> memberOrderStatus(Long mno); 
    
    OrderVO getOrder(Long ono);

    AddressVO addressDetail(Long ano);
    
    // 주문목록에 출력할 대표 이미지, 정보 조회
    OrderDetailVO firstOrderDetail(Long ono);
    
    OrderDetailVO orderDetail(Long odno);
    
    List<OrderDetailVO> orderDetails(Long ono);
    
    ProductVO productDetail(Long odno);
    
    int getTotal(@Param("cri") Criteria cri, @Param("filter")String filter, @Param("mno") Long mno);
    
    //주문 삭제
    void deleteOrder(Long ono);
}
