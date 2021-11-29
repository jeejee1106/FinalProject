package data.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;



@Service
public class ProjectListService {

	@Autowired
	ProjectListMapper mapper;
	
	public List<ProjectDTO> getAllProjects(String category,String state,String percent)
	{
//		System.out.println(search);
		return mapper.getAllProjects(category,state,percent);
	}
}
