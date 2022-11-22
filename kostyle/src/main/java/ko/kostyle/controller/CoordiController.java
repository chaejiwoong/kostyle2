package ko.kostyle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ko.kostyle.domain.CoordiVO;
import ko.kostyle.dto.CoordiDTO;
import ko.kostyle.dto.CoordiLikeDTO;
import ko.kostyle.dto.Criteria;
import ko.kostyle.dto.PageDTO;
import ko.kostyle.service.CoordiCommentService;
import ko.kostyle.service.CoordiLikeService;
import ko.kostyle.service.CoordiService;
//import ko.kostyle.util.SecurityUtil;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;


@Controller
@Log4j
@RequestMapping("/coordies")
@RequiredArgsConstructor
public class CoordiController {

	private final CoordiService service;
	private final CoordiLikeService likeService;
	
	//파일 업로드 폴더 생성
	private final String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	

	// 코디 글 목록(메인)
	@GetMapping
	public String list(Criteria cri, Model model){
		log.info("list Coordies.....................................");


		int total = service.getTotalCount(cri);
		PageDTO pageDTO = new PageDTO(cri, total);

		model.addAttribute("pageMaker", pageDTO);
		
		return "/coordies/coordies";
	}
	
	@GetMapping("/ajaxCoordies")
	public String getList(Criteria cri, Model model,
														HttpServletRequest request, HttpServletResponse response){
		
		
		log.info("정렬 누른 후 솔트 내놩ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" + cri.getSort());
		
		
		
		// 쿠키 주기
		Cookie cookie = new Cookie("listCookie", "");
		cookie.setPath("/");
		response.addCookie(cookie);

		//무한스크롤	
		cri.setAmount(12);
		
		log.info("페이지는 " + cri.getPageNum());
		model.addAttribute("getCoordiList", service.getList(cri));
		
		
		
		return "/coordies/ajaxCoordies";
	}
	
	
	//이미지 가져오기
	@GetMapping("/ajaxImge")
	public List<CoordiDTO> ajaxImg(Criteria cri) {
		return service.getList(cri);
	}
	

	
	// 코디 글 세부 보기
	@GetMapping("/get")
	public String get(@RequestParam("cno") Long cno, Model model,
			@CookieValue(name = "listCookie", required = false) Cookie cookie, HttpServletResponse response) {

		// 쿠키 확인
		if (cookie != null) {
			service.updateHitcount(cno);
			
			// 쿠키 삭제 -> 도메인, 경로 지정해줘야한다
			cookie.setMaxAge(0);
			cookie.setPath("/");
			
			log.info("쿠키 삭제후 맥스 에이지 값======" + cookie.getMaxAge()); 		
			response.addCookie(cookie);
		}
		model.addAttribute("coordi", service.getCoordi(cno));
		return "/coordies/getCoordi";
	}

	
	// 글쓰기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public String registerForm() {
		return "/coordies/registerCoordi";
	}
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	@ResponseBody
	public String register(@RequestBody CoordiDTO coordiDTO, RedirectAttributes rttr) {
		
		log.info("내가 넣은 값 디티오는?======" + coordiDTO);

		service.register(coordiDTO);
		rttr.addFlashAttribute("result", "success");

		return "ok";
	}
	
	
	//파일 업로드
	@PostMapping(value = "/upload", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public CoordiDTO uploadFile(MultipartFile file) {
		
		String uploadFolder = "C:\\upload"; //서버에 파일 업로드할 폴더 경로
		
		//폴더 만들기
		File filePath = new File(uploadFolder, getFolder());
		
		if(filePath.exists() == false) {
			filePath.mkdirs();
		}
		
		log.info("파일---------------------------");
		log.info("파일이름 " + file.getOriginalFilename());
		log.info("파일 크키" + file.getSize());
		
		CoordiDTO coordiDTO = new CoordiDTO();
		
		String fileName = file.getOriginalFilename();
		coordiDTO.setFilename(fileName);
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1); //IE의 경우 전체 파일 경로가 전송되므로 수정 필요 
		
		UUID uuid = UUID.randomUUID();
		fileName = uuid.toString() + "_" + fileName; //UUID를 통한 파일명 중복 방지
		
		
		try {
			File saveFile = new File(filePath, fileName);
			file.transferTo(saveFile);
			
			FileOutputStream thumbnail = new FileOutputStream(new File(filePath, "s_" + fileName)); //썸네일 파일명 설정			
			Thumbnailator.createThumbnail(file.getInputStream(), thumbnail, 100, 100); //썸네일 생성			
			thumbnail.close();		
					
			coordiDTO.setFilepath(getFolder().toString());
			
			coordiDTO.setUuid(uuid.toString());	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return coordiDTO;
	}
	
	
	//이미지 파일 삭제  -> @미완성
	@PostMapping("/deleteImg")
	public ResponseEntity<String> deleteFile(String fileName){
		
		log.info("넘어오는 파일 이름........" + fileName);
		
		File file = null;
		
		try {
			//썸네일 파일 삭제
			file = new File(URLDecoder.decode(fileName, "UTF-8"));
			//file = new File(URLDecoder.decode("C:\\kosta247\\kostyle4u-server\\coordi_upload\\2022\\11\\03\\s_300128f7-7679-4448-97b5-709e9469f78c_2.jpg", "UTF-8"));
			log.info("썸네일 명   " + file);		
			file.delete();
			
			//원본 파일 삭제
			String originFileName = file.getAbsolutePath().replace("s_", "");
			log.info("원본파일명 : " + originFileName);
			
			file = new File(originFileName);
			//file = new File("C:\\kosta247\\kostyle4u-server\\coordi_upload\\2022\\11\\03\\300128f7-7679-4448-97b5-709e9469f78c_2.jpg");
			file.delete();
		
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("no", HttpStatus.NOT_IMPLEMENTED);
		}
		return new ResponseEntity<String>("ok", HttpStatus.OK);
	   }

	

	
	// 글 수정 
	@GetMapping("/modify")
	public String update(@RequestParam("cno") Long cno, Model model) {
		model.addAttribute("coordi", service.getCoordi(cno));
		return "/coordies/modifyCoordi";
	}
	//미완성
	@ResponseBody   
	@PutMapping("/{cno}")   
	public String update(@PathVariable("cno") Long cno, @RequestBody CoordiDTO coordiDTO, RedirectAttributes rttr) {
		
		coordiDTO.setCno(cno);
		
		log.info("내가 수정한 코디==========" + coordiDTO);
		
		service.update(coordiDTO);
		rttr.addFlashAttribute("result", "success");
		
		return "ok";
	}

	
	//글 삭제
	@ResponseBody
	@DeleteMapping("/{cno}")
	public String delete(@PathVariable("cno") Long cno, RedirectAttributes rttr) {
		log.info("글삭제 컨트롤러 씨엔오=======" + cno);
		
		service.delete(cno);
		rttr.addFlashAttribute("result", "success");
		
		return "ok";
	}
	
	
	//좋아요
	@GetMapping("/like")
	@ResponseBody
	public String likeUp(CoordiLikeDTO likeDTO) {
		
		log.info("좋아요 클릭");
		
		String result;
		
		if(likeService.findLike(likeDTO) == 0) { //좋아요 아닌 상태
			likeService.likeUp(likeDTO);
			service.updateLikeCount(likeDTO.getCno());
			
			log.info("좋아요 아닌 상태");
			
			//화면에 꽉찬 하트 보이게 출력할 데이터 전송
			result = "꽉찬 하트";
			return result;
		}else{
			likeService.likeDown(likeDTO);
			service.updateLikeCount(likeDTO.getCno());
			
			log.info("좋아요 누른 상태");
			
			//빈하트 출력해야
			result = "텅빈 하트";
			return result;
		}
	}
	
	
	//마이페이지 - 코디
//	@GetMapping("/{mno}")
//	public String myPageCoordi(@PathVariable("mno") Long mno) {
//		return "";
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
