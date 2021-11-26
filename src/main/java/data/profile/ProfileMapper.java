package data.profile;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.project.ProjectDTO;

@Mapper
public interface ProfileMapper {
	
	public List<ProjectDTO> getCreativeProject(String name); // 내가 만든 프로젝트 리스트
	public ProjectDTO getProject(String idx);

}
