package data.mysetting;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberService;

@Controller
public class SettingController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/setting/main")
	public ModelAndView home(HttpSession session, Model model) {
		
		ModelAndView mview = new ModelAndView();
		
		String id = (String) session.getAttribute("id");
		
		MemberDTO dto = service.getAll(id);
		
		mview.addObject("dto", dto);
		mview.setViewName("/mysetting/settingForm");
		return mview;
		
	}

}
