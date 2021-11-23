package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {

	@Autowired
	ProjectMapper mapper;
	
	public void insertCategory(ProjectDTO dto) {
		mapper.insertCategory(dto);
	}
	
	public int getMAxIdx() {
		return mapper.getMAxIdx();
	}
}