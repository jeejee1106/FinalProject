package data.login;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import data.member.MemberMapper;



@Controller
public class LoginController {
	
	@Autowired
	MemberMapper mapper;
	
	
	@GetMapping("/login/main")
	public String login(HttpSession session, Model model){
		
		String myid = (String) session.getAttribute("myid");
		String loginok = (String) session.getAttribute("loginok");
		
		if(loginok == null) {
			return "/login/loginform";
		}else {
			//로그인중일경우 request에 로그인한 이름 저장하기
			String name = mapper.getName(myid);
			model.addAttribute("name", name);
			return "/";
		}
		
	}
	
	
	//@RequestParam (required = false) 이렇게 해주면 null값도 받을수 있다
	@PostMapping("/login/loginprocess")
	public String loginprocess(@RequestParam (required = false) String cbsave, @RequestParam String id, @RequestParam String pass,
			HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);
		System.out.println(cbsave);
		System.out.println(id);
		System.out.println(pass);
		int check = mapper.login(map);
		if(check == 1) {
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");
			session.setAttribute("saveok", cbsave); //체크 안했을 경우 null, 체크 했을경우 on
			return "redirect:main";
		}else {
			return "/login/passFail";  
		}
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		session.removeAttribute("loginok");
		return "redirect:main";
	}

}
