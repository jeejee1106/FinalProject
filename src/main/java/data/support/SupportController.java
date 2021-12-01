package data.support;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SupportController {

	@Autowired
	SupportService service;
	
	@GetMapping("/project_support/success")
	public ModelAndView supportSuccess(SupportDTO dto, HttpSession session, int idx, int supportNum) {
		ModelAndView mview = new ModelAndView();
		String sessionId = (String)session.getAttribute("id");
		
		String email = service.getEmail(sessionId);
		dto.setEmail(email);
		
		service.insertSupportData(dto);
		service.addSupporter(idx);
		service.addTotalAmount(idx);
		service.addSupportProject(sessionId, idx);
		
		mview.addObject("supportNum", supportNum+1);
		mview.setViewName("/project_detail/supportSuccess");
		
		return mview;
	}
}
