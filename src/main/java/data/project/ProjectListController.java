package data.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ProjectListController {


	@Autowired
	ProjectListMapper mapper;
	
	@GetMapping("/")
	public ModelAndView list()
	{
		ModelAndView mview=new ModelAndView();
		int totalCount=mapper.getTotalCount();
		List<ProjectDTO> list=mapper.getAllProjects();
		mview.addObject("list",list);
		mview.addObject("totalCount",totalCount);
		mview.setViewName("/layout/main");
		return mview;
	}
	
	@GetMapping("/listchul/listChul")
	public ModelAndView projectList () {
		ModelAndView mview=new ModelAndView();
		int totalCount=mapper.getTotalCount();
		List<ProjectDTO> list=mapper.getAllProjects();
		mview.addObject("list",list);
		mview.addObject("totalCount",totalCount);
		mview.setViewName("/listchul/listChul");
		return mview;
		
	}
	

	
}
