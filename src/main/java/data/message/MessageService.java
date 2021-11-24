package data.message;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
	
	@Autowired
	MessageMapper mapper;
	
	public int getReceivedTotalCount() {
		
		return mapper.getReceivedTotalCount();
	}
	
	public List<MessageDTO> getReceivedList(String recv_name) {
		//System.out.println(recv_name);
		return mapper.getReceivedMessageList(recv_name);
	}
	
	public List<MessageDTO> getSentMessageList(String send_name) {
		//System.out.println(send_name);
		return mapper.getSentMessageList(send_name);
	}
	
	public MessageDTO getMessage(String num) {
		
		return mapper.getMessage(num);
	}
	
	public void reply(MessageDTO dto) {
		mapper.reply(dto);
	}
	
}