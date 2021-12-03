package data.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberService;
import data.project.ProjectDTO;


@Controller
public class AdminController {

	@Autowired
	AdminService service;
	@Autowired
	MemberService memberSerivce;
	
	@GetMapping("/admin/project_management")
	public ModelAndView projectList(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		String id = (String) session.getAttribute("id");
		String name = memberSerivce.getName(id);
		MemberDTO dto = memberSerivce.getAll(id);
		
		List<ProjectDTO> list = service.getProjectList();
		//System.out.println(list);
		
		mview.addObject("dto", dto);
		mview.addObject("list", list);
		mview.setViewName("/profile/projectManagement");
		
		return mview;
	}
}
