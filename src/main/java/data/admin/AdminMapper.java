package data.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.project.ProjectDTO;

@Mapper
public interface AdminMapper {
	
	public List<ProjectDTO> getProjectList();
	public int getTotalCount();
	
	public void updateAuditAprvl(ProjectDTO pdto);
	public void updateAuditRefusal(ProjectDTO pdto);

}
