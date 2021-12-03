package data.support;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SupportService {

	@Autowired
	SupportMapper mapper;
	
	//support 테이블에 후원 정보 insert
	public void insertSupportData(SupportDTO dto) {
		mapper.insertSupportData(dto);
	}
	
	//project테이블에 후원자수 업데이트
	public void addSupporter(int idx) {
		mapper.addSupporter(idx);
	}
	
	//project테이블에 모인 금액 업데이트
	public void addTotalAmount(int idx){
		mapper.addTotalAmount(idx);
	}
	
	//member테이블에 후원한 프로젝트 업데이트
	public void addSupportProject(String id, int idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("idx", idx);
		mapper.addSupportProject(map);
	}
	
	//세션아이디를 통해 email값 가져오기
	public String getEmail(String id) {
		return mapper.getEmail(id);
	}
	
	//세션아이디를 통해 hp값 가져오기
	public String getHp(String id) {
		return mapper.getHp(id);
	}
}
