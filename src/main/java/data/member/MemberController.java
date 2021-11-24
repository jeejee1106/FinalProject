package data.member;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

	String url = "";

	@Autowired
	MemberService service;

	@GetMapping("/member/main")
	public String join() {

		return "/member/join";
	}

	@GetMapping("/member/join")
	public String memberform() {

		return "/member/memberForm";
	}

	@PostMapping("/member/insert")
	public String memberInsert(@ModelAttribute MemberDTO dto) {

		int leftLimit = 48; // numeral '0'
		int rightLimit = 122; // letter 'z'
		int targetStringLength = 15;
		Random random = new Random();

		String generatedString = random.ints(leftLimit, rightLimit + 1)
				.filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)).limit(targetStringLength)
				.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append).toString();

		System.out.println(generatedString);

		url = "http://localhost:9002/member/" + generatedString;
		dto.setUrl(url);
		System.out.println(url);
		service.insertMember(dto);
		return "/member/memberForm";
	}

}
