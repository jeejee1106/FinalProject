package data.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void insertMember(MemberDTO dto) {
		
		String encodedPassword = passwordEncoder.encode(dto.getPass());
		dto.setPass(encodedPassword);
		mapper.insertMember(dto);
	}
	
	public int getIdCheck(String id) {
		return mapper.getIdCheck(id);
	}
	public int getCheckPass(HashMap<String, String> map) {
		return mapper.getCheckPass(map);
	}
	public MemberDTO getMember(Integer num) {
		return mapper.getMember(num);
	} 
	public void updateMemberPhoto(MemberDTO dto) {
		mapper.updateMemberPhoto(dto);
	}
	public void updateMemberUrl(MemberDTO dto) {
		mapper.updateMemberUrl(dto);
	}
	public void updateMemberIntroduce(MemberDTO dto) {
		mapper.updateMemberIntroduce(dto);
	}
	public void updateMemberName(MemberDTO dto) {
		mapper.updateMemberName(dto);
	}
	public void updateMemberPrivacy(MemberDTO dto) {
		mapper.updateMemberPrivacy(dto);
	}
	
	public void updateMemberPass(MemberDTO dto) {
		String encodedPassword = passwordEncoder.encode(dto.getPass());
		dto.setPass(encodedPassword);
		mapper.updateMemberPass(dto);
	}
	
	public void updateMemberHp(MemberDTO dto) {
		mapper.updateMemberHp(dto);
	}
	
	public String getUrl(String id) {
		return mapper.getUrl(id);
	}
	public String getPhoto(String id) {
		return mapper.getPhoto(id);
	}
	public String getIntroduce(String id) {
		return mapper.getIntroduce(id);
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
	public void updateMemberAuthkey(MemberDTO dto) {
		mapper.updateMemberAuthkey(dto);
	}
	public void updateMemberStatus(MemberDTO dto) {
		mapper.updateMemberStatus(dto);
	}
	
	
	

}
