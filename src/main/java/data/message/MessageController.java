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

import data.member.MemberDTO;
import data.member.MemberMapper;
import data.member.MemberService;


@Controller
public class MessageController {
	
	@Autowired
	MessageService service;
	@Autowired
	MemberMapper memMapper;
	@Autowired
	MemberService memberService;
	
	// 받은 메세지 리스트
	@GetMapping("/message/receivedMessage")
	public ModelAndView receivedList (HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		//System.out.println("나의 아이디 "+id);
		//System.out.println("나의 name "+my_name);
		List<MessageDTO> recvList = service.getReceivedList(name);
		//System.out.println(recvList);
		
		MemberDTO dto = memberService.getAll(id);
		String photo = dto.getPhoto();
		
		mview.addObject("dto", dto);
		mview.addObject("photo", photo);
		
		mview.addObject("name", name);
		mview.addObject("recvList", recvList);
		mview.addObject("count", recvList.size());
		mview.setViewName("/message/receivedMessageList");
		
		//System.out.println(receivedList);
		return mview;
		
	}
	
	// 보낸 메세지 리스트
	@GetMapping("/message/sentMessage")
	public ModelAndView sentList (HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		List<MessageDTO> sendList = service.getSentMessageList(name);
		//System.out.println("상대방이름"+otherParty_name);
		//System.out.println("리스트"+sendList);
		//String otherParty_name = dto.getSend_name();
		
		
		mview.addObject("name", name);
		mview.addObject("sendList", sendList);
		mview.addObject("count", sendList.size());
		mview.setViewName("/message/sentMessageList");
		
		//System.out.println(receivedList);
		return mview;
		
	}
	
	// 메세지 가져오기
	@GetMapping("/message/messagedata")
	public @ResponseBody MessageDTO data(String num) {
		
		service.updateReadCount(num);
		return service.getMessage(num);
	}
	
	// 답장하기 insert
	@PostMapping("/message/messageReply")
	@ResponseBody
	public void reply(@ModelAttribute MessageDTO dto, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		String name = memMapper.getName(id);
		
		//System.out.println("name: "+name+", id: "+id);
		
		dto.setId(id);
		dto.setSend_name(name);
		
		service.reply(dto);	
		
	}
		
}
