package data.support;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import data.project.ProjectDTO;
import data.project.ProjectListMapper;
import data.project.ProjectListService;

@Controller
public class SupportController {

	@Autowired
	SupportService service;
	@Autowired
	ProjectListMapper listMapper;
	
	@GetMapping("/project_support/success")
	public ModelAndView supportSuccess(SupportDTO dto, HttpSession session, int idx, int supportNum, String addr, String hp) {
		ModelAndView mview = new ModelAndView();
		String sessionId = (String)session.getAttribute("id");
		
		String email = service.getEmail(sessionId);
		dto.setEmail(email);
		dto.setAddr(addr);
		//hp컬럼 만들어서 dto에 추가
		
		service.insertSupportData(dto);
		service.addSupporter(idx);
		service.addTotalAmount(idx);
		service.addSupportProject(sessionId, idx);
		
		List<ProjectDTO> alist=listMapper.allProjects();
		List<ProjectDTO> recommendList = new ArrayList<ProjectDTO>();
		int [] randomNumber = new int[4];
		for(int i=0; i<4; i++) {
			randomNumber[i] = (int)(Math.random()*(alist.size()-1));
			for(int j=0; j<i; j++) {
				if(randomNumber[j] == randomNumber[i]) {
					i--;
					continue;
				}
			}
		}
		for(int i=0; i<4; i++) {
			recommendList.add(alist.get(randomNumber[i]));
		}
		
		mview.addObject("recommendList",recommendList);
		mview.addObject("supportNum", supportNum+1);
		mview.setViewName("/project_detail/supportSuccess");
		
		return mview;
	}
}
