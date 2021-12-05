package data.project;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import data.member.MemberDTO;
import data.mysetting.DeliveryDTO;

@Mapper
public interface DetailMapper {
	public ProjectDTO getData(int idx);
	public String getPaymentDate(int idx);
	public DeliveryDTO getAddr(String id);
	public void setHp(MemberDTO dto);
	public void setEmail(MemberDTO dto);
	public void insertDelivery(DeliveryDTO ddto);
	public int getLikeCheck(HashMap<String, Object> map);
	public void insertLikeProject(HashMap<String, Object> map);
	public void deleteLikeProject(HashMap<String, Object> map);
}
