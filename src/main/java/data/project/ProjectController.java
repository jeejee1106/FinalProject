package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProjectController {

	@Autowired
	ProjectService service;
	@Autowired
	ProjectMapper mapper;
	
	@GetMapping("/project/start")
	public String start () {
		return "/project/projectStart";
	}
	
	
	@PostMapping("/project/insert")
	public String inert(@ModelAttribute ProjectDTO dto) {
		service.insertCategory(dto);
		return "redirect:editor?num=" + service.getMAxIdx();
	}
	
	@GetMapping("/project/editor")
	public String editor() {
		return "/project/editor";
	}
	
}
