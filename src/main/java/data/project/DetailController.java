package data.project;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailController {

	@Autowired
	DetailService service;
	
	@GetMapping("/project/detail")
	public ModelAndView getData(int idx, String key) {
		ModelAndView mview = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today = java.sql.Date.valueOf(sdf.format(new Date()));
		
		String pymDate1 = service.getPaymentDate(idx).substring(0,4);
		String pymDate2 = service.getPaymentDate(idx).substring(5,7);
		String pymDate3 = service.getPaymentDate(idx).substring(8,10);
		
		ProjectDTO dto = service.getData(idx);
		
		mview.addObject("pymDate1", pymDate1);
		mview.addObject("pymDate2", pymDate2);
		mview.addObject("pymDate3", pymDate3);
		mview.addObject("dto", dto);

		mview.addObject("today", today);
		
		if(key.equals("detail")) {
			mview.setViewName("/project_detail/projectDetail");
		} else {
			mview.setViewName("/project_detail/payment");
		}
		
		return mview;
	}
	
}
