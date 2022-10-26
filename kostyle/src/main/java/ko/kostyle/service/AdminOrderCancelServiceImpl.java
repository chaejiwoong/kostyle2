package ko.kostyle.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.domain.OrderCancelVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.dto.AdminProductDTO;
import ko.kostyle.dto.OrderCancelDTO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.OrderCancelMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
@Transactional(readOnly = true)
public class AdminOrderCancelServiceImpl implements AdminOrderCancelService{
	
	private final OrderCancelMapper orderCancelMapper;
	private final AdminOrderMapper adminOrderMapper;
	
	
	@Override
	@Transactional
	public void insertOrderCancel(OrderCancelDTO dto, Long odno) {
		OrderCancelVO vo = new OrderCancelVO();
		vo.setCategory(dto.getCategory());
		vo.setReason(dto.getReason());
		vo.setOdno(odno);
		orderCancelMapper.insertOrderCancel(vo);
		OrderDetailVO orderDetail = adminOrderMapper.getOrderDetail(odno);
		orderCancelMapper.updateOrderPrice(orderDetail.getPrice(), orderDetail.getOno());
		log.info("updateOrderPrice......." + orderDetail.getPrice());
		
	}

	@Override
	public List<OrderCancelDTO> getOrderCancelList() {		
		
		// vo를 dto list로 변환 후 반환
		return orderCancelMapper.orderCancelList()
				.stream().map(vo -> getDto(vo))
				.collect(Collectors.toList());
			
	}

	@Override
	public OrderCancelDTO getOrderCancelDetail(Long ocno) {
		
		return  getDto(orderCancelMapper.orderCancelDetail(ocno));
		
	}

	private OrderCancelDTO getDto(OrderCancelVO orderCancel) {
		OrderCancelDTO dto = new OrderCancelDTO();
		
		dto.setOcno(orderCancel.getOcno());
		dto.setReason(orderCancel.getReason());
		dto.setCategory(orderCancel.getCategory());
		dto.setCreated_date(orderCancel.getCreated_date());
		
		ProductVO product = adminOrderMapper.productDetail(orderCancel.getOdno());
		AdminProductDTO productDto = new AdminProductDTO();
		productDto.setPno(product.getPno());
		productDto.setName(product.getName());
		
		dto.setProduct(productDto);
		
		return dto;
	}

}
