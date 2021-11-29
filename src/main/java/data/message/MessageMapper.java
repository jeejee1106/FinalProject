package data.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
	
	
	public List<MessageDTO> getReceivedMessageList(String recv_name); //받는 사람에 대한 리스트
	public List<MessageDTO> getSentMessageList(String send_name); //보낸 사람에 대한 리스트
	
	public MessageDTO getMessage(String num); // num에 대한 메세지 반환
	public void reply(MessageDTO dto); // 답장
	
	public void updateReadCount(String num); //조회수 증가-0 안읽음 1이상 읽음
	
	
	public int getReceivedTotalCount();

}
