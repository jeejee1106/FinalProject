package data.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public void insertMember(MemberDTO dto) {
		mapper.insertMember(dto);
	}
	
	public int getIdCheck(String id) {
		return mapper.getIdCheck(id);
	}
	public int getCheckPass(HashMap<String, String> map) {
		return mapper.getCheckPass(map);
	}
	public MemberDTO getMember(String num) {
		return mapper.getMember(num);
	}
	public void updateMember(MemberDTO dto) {
		mapper.updateMember(dto);
	}
	public void deleteMember(String num) {
		mapper.deleteMember(num);
	}
	
	public String getName(String id) {
		return mapper.getName(id);
	}
	public int login(HashMap<String, String> map) {
		return mapper.login(map);
	}
	
	public int getNameCheck(String name) {
		return mapper.getNameCheck(name);
	}
	
	public MemberDTO getAll(String id) {
		return mapper.getAll(id);
	}
	

}
