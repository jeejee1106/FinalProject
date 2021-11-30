package data.mysetting;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class DeliveryService {
	@Autowired
	DeliveryMapper mapper;

	public List<DeliveryDTO> getAll(String id) {
		return mapper.getAll(id);
	}
	public void insertDelivery(DeliveryDTO ddto) {
		mapper.insertDelivery(ddto);
	}
	
	public int getTotalCount(String id) {
		return mapper.getTotalCount(id);
	}
	
	public int getPin(HashMap<String, String> map) {
		return mapper.getPin(map);
	}
	
	public int getPinNum(HashMap<String, String> map) {
		return mapper.getPinNum(map);
	}
	public void updateDeliveryPin(int num) {
		mapper.updateDeliveryPin(num);
		System.out.println("service"+num);
	}
}
