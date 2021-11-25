package data.project;

import java.text.SimpleDateFormat;

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
		//SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String pymDate = service.getPaymentDate(idx);
		
		ProjectDTO dto = service.getData(idx);
		
		mview.addObject("pymDate", pymDate);
		mview.addObject("dto", dto);
		mview.setViewName("/project_detail/projectDetail");
		
		return mview;
	}
	
	@GetMapping("/project/payment")
	public String payment() {
		
		return "/project_detail/payment";
	}
	
}
