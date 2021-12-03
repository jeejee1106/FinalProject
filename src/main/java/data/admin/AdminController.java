package data.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberService;
import data.profile.ProfileService;
import data.project.ProjectDTO;


@Controller
public class AdminController {

	@Autowired
	AdminService service;
	@Autowired
	MemberService memberSerivce;
	@Autowired
	ProfileService profileSerivce;
	
	@GetMapping("/admin/project_management")
	public ModelAndView projectList(HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		String id = (String) session.getAttribute("id");
		MemberDTO dto = memberSerivce.getAll(id);
		
		List<ProjectDTO> list = service.getProjectList();
		//System.out.println(list);
		
		mview.addObject("dto", dto);
		mview.addObject("list", list);
		mview.setViewName("/admin/projectManagement");
		
		return mview;
	}
	
	@GetMapping("/admin/project_aprvl")
	@ResponseBody
	public void updateAprvl(@ModelAttribute ProjectDTO pdto) {
		
		service.updateAuditAprvl(pdto);
	}
	
	@GetMapping("/admin/project_refusal")
	@ResponseBody
	public void updateRefusal(@ModelAttribute ProjectDTO pdto) {
		
		service.updateAuditRefusal(pdto);
	}
	
	@GetMapping("/admin/audit_detail")
	@ResponseBody
	public ModelAndView auditDetail (@RequestParam String idx) {
		
		ModelAndView mview = new ModelAndView();
		ProjectDTO pdto = profileSerivce.getProject(idx);
		
		mview.addObject("pdto", pdto);
		mview.setViewName("/admin/auditDetail");
		
		return mview;
	}
	
	
}
