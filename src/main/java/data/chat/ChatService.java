package data.chat;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatService {
	@Autowired
	ChatMapper chatMapper;
	
	public void sendMessage(ChatDTO dto) {
		chatMapper.sendMessage(dto);
	}
	public List<ChatDTO>  getRoomContentList(ChatDTO dto){
		List<ChatDTO> list = chatMapper.getRoomContentList(dto);
		return list;
	}
	public int getMaxRoom() {
		return chatMapper.getMaxRoom();
	}
	public String getRoomNumber(ChatDTO dto) {
		
		String room = chatMapper.getRoomNumber(dto);
		System.out.println("서비스 방"+room);
		
		//방이 없을 경우 새로운 방 생성
		if(room==null) {
			int temp = chatMapper.getMaxRoom()+1;
			room = String.valueOf(temp);
		}
		
		System.out.println("서비스 방2"+room);
		return room;
	}
	
	public List<ChatDTO> getChatList(String id){
		List<ChatDTO> list = chatMapper.getChatList(id);
		return list;
	}
	//읽지 않은 메세지 수
	public int countUnreadMessage(ChatDTO dto) {
		int unread = chatMapper.countUnreadMessage(dto);
		return unread;
	}
	
	//메세지 읽음처리
	public void changeMessageReadCheck(ChatDTO dto) {
		chatMapper.changeMessageReadCheck(dto);
	}
	
	//메세지 읽은시간 변경
	public void changeMessageReadTime(ChatDTO dto) {
		chatMapper.changeMessageReadTime(dto);
	}
	
	//메세지 상대방 프로필 가져오기
	public String getOtherProfile(ChatDTO dto) {
		return chatMapper.getOtherProfile(dto);
	}
	
	//채팅방나가기
	//방을 나간 회원수 구하기
	public int countExitId(String room) {
		return chatMapper.countExitId(room);
	}
	
	//방을 나간 회원아이디 얻기
	public String getExitId(String room) {
		return chatMapper.getExitId(room);
	}
	
	//방을 나간 회원이름 등록하기
	public void updateExitId(String room, String exit_id) {
		chatMapper.updateExitId(room, exit_id);
	}
	
	//두명다 방을 나간경우 방삭제
	public void deleteRoom(String room) {
		chatMapper.deleteRoom(room);
	}
}
