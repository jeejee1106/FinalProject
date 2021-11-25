package data.message;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberMapper;


@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	@Autowired
	MemberMapper memMapper;
	
	// 받은 메세지 리스트
	@GetMapping("/receivedMessage")
	public ModelAndView receivedList (HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		String my_name = memMapper.getName(id);
		//System.out.println("나의 아이디 "+id);
		//System.out.println("나의 name "+my_name);
		List<MessageDTO> recvList = service.getReceivedList(id);
		System.out.println(recvList);
		
		mview.addObject("my_name", my_name);
		mview.addObject("recvList", recvList);
		mview.addObject("count", recvList.size());
		mview.setViewName("/message/receivedMessageList");
		
		//System.out.println(receivedList);
		return mview;
		
	}
	
	// 보낸 메세지 리스트
	@GetMapping("/sentMessage")
	public ModelAndView sentList (HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		String id = (String)session.getAttribute("id");
		List<MessageDTO> sendList = service.getSentMessageList(id);
		//String send_name = memMapper.getName(id);
		MessageDTO dto = (MessageDTO) service.getReceivedList(id);
		String otherParty_name = dto.getSend_name();
		
		//System.out.println(send_name);
		
		mview.addObject("otherParty_name", otherParty_name);
		mview.addObject("sendList", sendList);
		mview.addObject("count", sendList.size());
		mview.setViewName("/message/sentMessageList");
		
		//System.out.println(receivedList);
		return mview;
		
	}
	
	// 메세지 가져오기
	@GetMapping("/messagedata")
	public @ResponseBody MessageDTO data(String num) {
		
		return service.getMessage(num);
	}
	
	// 답장하기 insert
	@PostMapping("messageReply")
	public void reply(@ModelAttribute MessageDTO dto, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		String name = (String) session.getAttribute("name");
		
		System.out.println("name: "+name+", id: "+id);
		// 내 아이디에 대한 name 얻기
		
		dto.setId(id);
		dto.setSend_name(name);
		
		service.reply(dto);
		
	}
		
}
