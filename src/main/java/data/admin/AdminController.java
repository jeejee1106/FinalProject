package data.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.project.ProjectDTO;


@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@GetMapping("/admin/project_management")
	public ModelAndView projectList() {
		
		ModelAndView mview = new ModelAndView();
		
		List<ProjectDTO> list = service.getProjectList();
		//System.out.println(list);
		
		mview.addObject("list", list);
		
		mview.setViewName("/profile/projectManagement");
		
		return mview;
	}
}
