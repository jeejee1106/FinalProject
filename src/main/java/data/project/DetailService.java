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
	public String getPaymentDate(int idx) {
		return mapper.getPaymentDate(idx);
	}
	public String getEmail(String id) {
		return mapper.getEmail(id);
	}
	public String getPhonNumber(String id) {
		return mapper.getPhonNumber(id);
	}
	
}
