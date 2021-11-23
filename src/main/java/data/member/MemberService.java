package data.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	@Autowired
	MemberMapper mapper;
	
	public void insertMember(MemberDTO dto) {
		mapper.insertMember(dto);
	}
	

}
