package ko.kostyle.service;

import ko.kostyle.domain.AddressVO;
import ko.kostyle.domain.MemberVO;
import ko.kostyle.domain.OrderDetailVO;
import ko.kostyle.domain.OrderVO;
import ko.kostyle.domain.ProductVO;
import ko.kostyle.dto.AddressDTO;
import ko.kostyle.dto.AdminOrderDetailDTO;
import ko.kostyle.dto.AdminProductDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ko.kostyle.dto.AdminOrderDTO;
import ko.kostyle.dto.members.MemberDTO;
import ko.kostyle.mapper.AdminOrderMapper;
import ko.kostyle.mapper.MemberMapper;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
@Log4j
@Transactional(readOnly = true)
public class AdminOrderServiceImpl implements AdminOrderService {

    private final AdminOrderMapper orderMapper;
    private final MemberMapper memberMapper;

    //관리자 주문정보 가져오기
    @Override
    public List<AdminOrderDTO> orderList() {
        List<OrderVO> orders = orderMapper.orderList();
        List<AdminOrderDTO> dtos = new ArrayList<>();
        for (OrderVO order : orders) {
            MemberVO vo = memberMapper.memberDetailById(order.getMno());
            AdminOrderDTO dto = AdminOrderDTO.builder()
                    .ono(order.getOno())
                    .member(MemberDTO.of(vo))
                    .payment(order.getPayment())
                    .totalPrice(order.getTotalPrice())
                    .status(order.getStatus())
                    .created_date(order.getCreated_date())
                    .build();

            dtos.add(dto);
        }

        return dtos;
    }

    // 하나의 주문 조회
    @Override
    public AdminOrderDTO orderDetail(Long ono) {
        OrderVO order = orderMapper.getOrder(ono);
        MemberVO member = memberMapper.memberDetailById(order.getMno());
        AddressVO address = orderMapper.addressDetail(order.getAno());

        AddressDTO addressDTO = AddressDTO.builder()
                .ano(address.getAno())
                .address(address.getAddress())
                .tel(address.getTel())
                .name(address.getName())
                .is_default(address.is_default())
                .build();


        AdminOrderDTO dto = AdminOrderDTO.builder()
                .ono(order.getOno())
                .address(addressDTO)
                .member(MemberDTO.of(member))
                .payment(order.getPayment())
                .totalPrice(order.getTotalPrice())
                .status(order.getStatus())
                .created_date(order.getCreated_date())
                .build();

        return dto;
    }

    @Override
    public List<AdminOrderDetailDTO> orderDetails(Long ono) {
        List<OrderDetailVO> list = orderMapper.orderDetails(ono);
        log.info("----------------------------------------");
        
        log.info("orderDetails : " + list);
        List<AdminOrderDetailDTO> dtos = new ArrayList<AdminOrderDetailDTO>();
        
        for(OrderDetailVO orderDetail : list) {
        	AdminOrderDetailDTO dto = new AdminOrderDetailDTO();
        	
        	ProductVO product = orderMapper.productDetail(orderDetail.getOdno());
        	AdminProductDTO productDto = AdminProductDTO.builder()
        									.pno(product.getPno())
        									.name(product.getName())
        									.build();
        	
        	dto.setOdno(orderDetail.getOdno());
        	dto.setOno(ono);
        	dto.setProduct(productDto);
        	dto.setAmount(orderDetail.getAmount());
        	dto.setPrice(orderDetail.getPrice());
        	
        	dtos.add(dto);
        }
        
        return dtos; 
    }

}
