package data.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("/mypage")
	public String introduction (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String loginok = (String)session.getAttribute("loginok");
		//System.out.println(loginok);
		
		if(loginok == null) {
			return "redirect:/login/main";
			
		} else {
			return "/mypage/introduction";
		}
		
	}
	
	@GetMapping("/mypage/backed")
	public String sponsoredList () {
		return "/mypage/sponsoredProject";
	}
	
	@GetMapping("/mypage/created")
	public String uploadeList () {
		return "/mypage/uploadedProject";
	}
	
	@GetMapping("/mypage/liked")
	public String interestList () {
		return "/mypage/projectInterest";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@GetMapping("/login/login")
	public String login(HttpSession session) {
		System.out.println("login");
		session.setAttribute("id", "둘리");
		session.setAttribute("name", "둘리");
		session.setAttribute("loginok", "yes");
		return "/";
	}
	@GetMapping("/logout/logout")
	public String logout(HttpSession session) {
		System.out.println("logout");
		session.removeAttribute("loginok");
		session.removeAttribute("id");
		
		return "/";
		
	}

	
	
	
	
	
	
	
	
}
