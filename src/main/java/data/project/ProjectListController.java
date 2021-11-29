package data.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ProjectListController {


	@Autowired
	ProjectListMapper mapper;
	
	@Autowired
	ProjectListService service;
	
	@GetMapping("/")
	public ModelAndView mainList()
	{
		ModelAndView mview=new ModelAndView();
		List<ProjectDTO> alist=mapper.allProjects();
		List<ProjectDTO> plist=mapper.popProjects();
		List<ProjectDTO> elist=mapper.endProjects();
		List<ProjectDTO> nlist=mapper.newProjects();
		mview.addObject("alist",alist);
		mview.addObject("plist",plist);
		mview.addObject("elist",elist);
		mview.addObject("nlist",nlist);
		mview.setViewName("/layout/main");
		return mview;
	}
	
	@GetMapping("/listchul/listChul")
	public ModelAndView projectList (String category,String state,String percent) {
		ModelAndView mview=new ModelAndView();
		int totalCount=mapper.getTotalCount();
		List<ProjectDTO> list= mapper.getAllProjects(category,state,percent);
//		System.out.println(search);
		//List<ProjectDTO> list=mapper.getSearchProjects(search);
		
		mview.addObject("list",list);
		mview.addObject("totalCount",totalCount);
		mview.addObject("category",category);
		mview.addObject("state",state);
		mview.setViewName("/listchul/listChul");
		return mview;
		
	}
	@ResponseBody
	@GetMapping("/listchul/listAll")
	public List<ProjectDTO> alist(String category,String state,String percent)
	{
		return service.getAllProjects(category,state,percent);
	}


}
