package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {

	@Autowired
	ProjectService service;
	@Autowired
	ProjectMapper mapper;
	
	@GetMapping("/project/start")
	public String start () {
		return "/project_create/projectStart";
	}
	
	
	@PostMapping("/project/insert")
	public String inert(@ModelAttribute ProjectDTO dto) {
		service.insertCategory(dto);
		return "redirect:editor?idx=" + service.getMAxIdx();
	}
	
	@GetMapping("/project/editor")
	public ModelAndView editor(@RequestParam String idx) {
		ModelAndView mview = new ModelAndView();
		mview.addObject("idx", idx);
		mview.setViewName("/project_create/editor");
		
		return mview;
	}
	

	
}
