package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.mysetting.DeliveryDTO;

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
	
	//세션아이디를 통해 addr값 가져오기
	public DeliveryDTO getAddr(String id) {
		return mapper.getAddr(id);
	}
}
