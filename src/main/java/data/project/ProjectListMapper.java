package data.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.bind.annotation.RequestParam;


@Mapper
public interface ProjectListMapper {

	public int getTotalCount();
	public List<ProjectDTO> getAllProjects(String category,String state,String percent);
	public List<ProjectDTO> allProjects();
	public List<ProjectDTO> endProjects();
	public List<ProjectDTO> newProjects();
	public List<ProjectDTO> popProjects();
}
