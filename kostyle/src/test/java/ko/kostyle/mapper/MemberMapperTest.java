package ko.kostyle.mapper;

import java.io.InputStream;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import ko.kostyle.domain.MemberVO;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
@WebAppConfiguration
public class MemberMapperTest {

	@Autowired
	private MemberMapper mapper;
	
	@Autowired PasswordEncoder passwordEncoder;

//	@Test
//	public void insertTest() {
//
//		IntStream.range(0, 200).forEach(i -> {
//			MemberVO vo = new MemberVO();
//			vo.setEmail("test" + i);
//			vo.setName("tester" + i);
//			vo.setBirth(111111 + i);
//			vo.setAuthority("ROLE_USER");
//			vo.setGender(i%2==0?"M":"F");
//			vo.setPassword(passwordEncoder.encode("test" + i));
//			
//			mapper.memberInsert(vo);
//		});
//
//	}
	
	@Test
	public void adminInsert() {

		IntStream.range(0, 1).forEach(i -> {
			MemberVO vo = new MemberVO();
			vo.setEmail("admin");
			vo.setName("admin");
			vo.setBirth(111111);
			vo.setAuthority("ROLE_ADMIN");
			vo.setGender(i%2==0?"M":"F");
			vo.setPassword(passwordEncoder.encode("admin"));
			
			mapper.memberInsert(vo);
		});

	}
}
