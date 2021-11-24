package data.message;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MessageMapper {
	
	
	public List<MessageDTO> getReceivedMessageList(String recv_name); //받는 사람에 대한 리스트
	public List<MessageDTO> getSentMessageList(String send_name); //받는 사람에 대한 리스트
	
	public MessageDTO getMessage(String num); // num에 대한 메세지 반환
	public void reply(MessageDTO dto); // 답장
	
	
	
	public int getReceivedTotalCount();
	//public MessageDTO getReceivedMessage(String recv_nick);
	//public MessageDTO getSentMessage(String send_nick);

}
