package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetailService {
	
	@Autowired
	DetailMapper mapper;

	public ProjectDTO getData(int idx) {
		return mapper.getData(idx);
	}
}
