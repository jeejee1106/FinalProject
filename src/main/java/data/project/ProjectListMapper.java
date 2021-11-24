package data.project;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ProjectListMapper {

	public int getTotalCount();
	public List<ProjectDTO> getAllProjects();
	public ProjectDTO getData(String num);
}
