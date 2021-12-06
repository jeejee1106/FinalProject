package data.profile;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.project.ProjectDTO;
import data.support.SupportDTO;

@Mapper
public interface ProfileMapper {
	
	public List<ProjectDTO> getCreativeProject(String name); // 내가 만든 프로젝트 리스트
	public ProjectDTO getProject(String idx);
	public void deleteCreativeProject(String idx); //창작한 프로젝트 삭제
	
	public List<SupportDetailDTO> getSupportProject(String id); // 후원한 프로젝트 리스트
	public SupportDetailDTO getSupportData(String num);
	public void deleteSupport(String num);
	
	public List<LikedDTO> getLikedProject(String id); // 찜한 프로젝트 리스트
	public void deleteLikedProject(String idx);
	
	public String getCreativeAuditCount(String audit, String name);

}
