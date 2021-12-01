package data.admin;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.project.ProjectDTO;

@Service
public class AdminService {

	@Autowired
	AdminMapper mapper;
	
	public List<ProjectDTO> getProjectList(){
		
		return mapper.getProjectList();
	}
	public int getTotalCount() {
		
		return mapper.getTotalCount();
	}
}
