package data.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.member.MemberDTO;
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
	
	//핸드폰 번호가 null인 멤버들 핸드폰 번호 넣어주기
	public void setHp(MemberDTO dto) {
		mapper.setHp(dto);
	}
	
	//email일 null인 멤버들 email주소 넣어주기
	public void setEmail(MemberDTO dto) {
		mapper.setEmail(dto);
	}
	
	//주소 데이터가 없는 멤버들 주소 데이터 insert하기
	public void insertDelivery(DeliveryDTO ddto) {
		mapper.insertDelivery(ddto);
	}
}
