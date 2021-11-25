package data.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ProjectListService {

	@Autowired
	ProjectListMapper mapper;
	
	public List<ProjectDTO> getAllProjects()
	{
		return mapper.getAllProjects();
	}
}
