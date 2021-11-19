package data.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProjectController {

	
	@GetMapping("/project/start")
	public String start () {
		return "/project/projectStart";
	}
	
	@GetMapping("/project/insert")
	public String inert() {
		return "";
	}
}
