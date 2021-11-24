package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailController {

	@Autowired
	DetailService service;
	
	@GetMapping("/project/detail")
	public ModelAndView getData(int idx) {
		ModelAndView mview = new ModelAndView();
		
		ProjectDTO dto = service.getData(idx);
		mview.addObject("dto", dto);
		mview.setViewName("/project_detail/projectDetail");
		
		return mview;
	}
	
}
