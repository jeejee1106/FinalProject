package data.profile;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.project.ProjectDTO;
import data.support.SupportDTO;

@Service
public class ProfileService {
	
	@Autowired
	ProfileMapper mapper;
	
	public List<ProjectDTO> getCreativeProject (String name) {
		
		return mapper.getCreativeProject(name);
	}
	
	public ProjectDTO getProject (String idx) {
		
		return mapper.getProject(idx);
	}
	
	public void deleteCreativeProject (String idx) {
		
		mapper.deleteCreativeProject(idx);
	}
	
	public String getCreativeAuditCount(String audit, String name) {
		
		return mapper.getCreativeAuditCount(audit, name);
	}
	
	public List<SupportDetailDTO> getSupportProject (String id) {
		
		return mapper.getSupportProject(id);
	}
	
	public SupportDetailDTO getSupportData (String num) {
		
		return mapper.getSupportData(num);
	}
	
	public void deleteSupport (String num) {
		
		mapper.deleteSupport(num);
	}
	
	public List<LikedDTO> getLikedProject(String id) {
		
		return mapper.getLikedProject(id);
	}
	public void deleteLikedProject (String num) {
		
		mapper.deleteLikedProject(num);
	}

}