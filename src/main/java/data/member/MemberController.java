package data.member;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {

	String url = "";

	@Autowired
	MemberService service;
	
	@GetMapping("/member/home")
	public String home() {
		return "/";
	}
	
	@GetMapping("/member/main")
	public String join() {

		return "/member/join";
	} 

	@GetMapping("/member/join")
	public String memberform() {

		return "/member/memberform";
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

		url = generatedString;
		dto.setUrl(url);
		System.out.println(url);
		service.insertMember(dto);
		return "redirect:home";
	}
	
	@GetMapping("/member/idcheck") //@responsebody 를 넣어주면 rest컨트롤러처럼 변경
	public @ResponseBody Map<String, Integer> idCheckProcess(@RequestParam String id) 
	{
		//id 체크
		int check = service.getIdCheck(id);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("check", check);//0 or 1
		return map;
	}
	
	@GetMapping("/member/namecheck") //@responsebody 를 넣어주면 rest컨트롤러처럼 변경
	public @ResponseBody Map<String, Integer> nameCheckProcess(@RequestParam String name) 
	{
		//id 체크
		int check = service.getNameCheck(name);
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("check", check);//0 or 1
		return map;
	}

	


}
