package data.project;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectMapper {

	public void insertCategory(ProjectDTO dto);
	
	public int getMAxIdx();
}