package data.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import data.member.MemberMapper;

@Controller
public class MypageController {
	
	@Autowired
	MemberMapper mapper;
	
	@GetMapping("/mypage")
	public String introduction (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String loginok = (String)session.getAttribute("loginok");
		//System.out.println(loginok);
		
		if(loginok == null) {
			return "redirect:/login/main";
			
		} else {
			//String name = mapper.getName(id);
			String name = mapper.getName(id);
			System.out.println(name);
			model.addAttribute("name", name);
			return "/mypage/introduction";
		}
		
	}
	
	@GetMapping("/mypage/backed")
	public String sponsoredList (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String name = mapper.getName(id);
		System.out.println(name);
		model.addAttribute("name", name);
		
		return "/mypage/sponsoredProject";
	}
	
	@GetMapping("/mypage/created")
	public String uploadeList (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String name = mapper.getName(id);
		System.out.println(name);
		model.addAttribute("name", name);
		
		return "/mypage/uploadedProject";
	}
	
	@GetMapping("/mypage/liked")
	public String interestList (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String name = mapper.getName(id);
		System.out.println(name);
		model.addAttribute("name", name);
		
		return "/mypage/projectInterest";
	}
	
}
