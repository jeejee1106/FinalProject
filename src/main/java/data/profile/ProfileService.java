package data.profile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.project.ProjectDTO;

@Service
public class ProfileService {
	
	@Autowired
	ProfileMapper mapper;
	
	public List<ProjectDTO> getCreativeProject (String name) {
		
		return mapper.getCreativeProject(name);
	}
	
	public ProjectDTO getProject(String idx) {
		
		return mapper.getProject(idx);
	}
	
	public void deleteCreativeProject(String idx) {
		
		mapper.deleteCreativeProject(idx);
	}

}