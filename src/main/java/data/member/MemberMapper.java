package data.member;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface MemberMapper {
	public void insertMember(MemberDTO dto);
	
	public int getIdCheck(String id);
	public int getNameCheck(String name);
	public int getCheckPass(HashMap<String, String> map);
	public MemberDTO getMember(String num);
	public void updateMember(MemberDTO dto);
	public void deleteMember(String num);
	
	public String getName(String id);		
	public int login(HashMap<String, String> map);

}
