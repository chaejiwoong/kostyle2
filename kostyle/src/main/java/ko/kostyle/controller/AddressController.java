package ko.kostyle.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ko.kostyle.dto.AddressDTO;
import ko.kostyle.service.AddressService;
import ko.kostyle.service.AuctionService;
import ko.kostyle.service.BidService;
import ko.kostyle.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/members/address")
public class AddressController {
	
	private final AddressService addressService;
	
	// 배송지 목록
	@GetMapping
	public String memberAddressList(Model model) {
		model.addAttribute("addresses", addressService.addressList());
		return "address/addressList";
	}
	
	// 배송지 목록 ajax
	@GetMapping(value="/ajax", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<List<AddressDTO>> ajaxMemberAddressList() {
		
		return new ResponseEntity<List<AddressDTO>>(addressService.addressList(), HttpStatus.OK);
	}
	
	//ajax 상세 불러오기
	@GetMapping(value="/ajax/{ano}", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<AddressDTO> addressUpdateForm(@PathVariable Long ano) {
		
		return new ResponseEntity<AddressDTO>(addressService.addressDetail(ano), HttpStatus.OK);

	}
	
	
	// 등록 폼
	@GetMapping("/register")
	public String addressRegisterForm() {
		
		return "address/addressRegister";
	}
	
	// 등록
	@PostMapping(value="/register", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public ResponseEntity<Long> addressRegister(@RequestBody AddressDTO dto){

		
		return new ResponseEntity<Long>(addressService.insertAddresse(dto), HttpStatus.OK);
	}
	
	// 수정 폼
	@GetMapping("/{ano}")
	public String addressUpdateForm(Model model, @PathVariable Long ano) {
		
		model.addAttribute("address", addressService.addressDetail(ano));
		
		return "address/addressUpdate";
	}
	

	
	// 수정
	@PutMapping("/{ano}")
	@ResponseBody
	public ResponseEntity<String> updateAddress(@RequestBody AddressDTO dto, @PathVariable Long ano){
		dto.setAno(ano);
		addressService.updateAddress(dto);

		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}	
	
	// 기본배송지 변경
	@PutMapping("/changeDefault/{ano}")
	@ResponseBody
	public ResponseEntity<String> updateDefault(@PathVariable Long ano){
		
		addressService.updateDefault(ano);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
	
	// 삭제
	@DeleteMapping("/{ano}")
	@ResponseBody
	public ResponseEntity<String> deleteAddress(@PathVariable Long ano){
		addressService.deleteAddress(ano);
		
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	}
}
