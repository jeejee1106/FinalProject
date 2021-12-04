package data.admin;

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
	public void updateAuditAprvl(ProjectDTO pdto) {
		
		mapper.updateAuditAprvl(pdto);
	}
	public void updateAuditRefusal(ProjectDTO pdto) {
		
		mapper.updateAuditRefusal(pdto);
	}
	public String getAuditCount() {
		
		return mapper.getAuditCount();
	}
}
