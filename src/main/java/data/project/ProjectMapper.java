package data.project;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProjectMapper {

	public void insertCategory(ProjectDTO dto);
	
	public int getMAxIdx();
	
	public void storyUpdate(ProjectDTO dto);
	
	public void defaultUpdate(ProjectDTO dto);
	
	public void fundingUpdate(ProjectDTO dto);
	
	public void policyUpdate(ProjectDTO dto);
	
	public ProjectDTO getData(String idx);
	
	public void insertPresent(PresentDTO pstdto);
}
