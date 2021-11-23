package data.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ListController {


	@Autowired
	ListMapper mapper;
	
	@GetMapping("/layout/main")
	public ModelAndView list()
	{
		System.out.println("컨트롤러 실행");
		ModelAndView mview=new ModelAndView();
		int totalCount=mapper.getTotalCount();
		List<ProjectDTO> list=mapper.getAllProjects();
		System.out.println(list.size());
		mview.addObject("list",list);
		mview.addObject("totalCount",totalCount);
		mview.setViewName("/layout/main");
		return mview;
	}
	

	
}