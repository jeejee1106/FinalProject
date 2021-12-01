package data.project;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberMapper;
import data.message.MessageDTO;
import data.message.MessageService;

@Controller
public class DetailController {

	@Autowired
	DetailService service;
	@Autowired
	MemberMapper memMapper;
	@Autowired
	MessageService messageService;
	
	@GetMapping("/project/detail")
	public ModelAndView getDetailData(int idx, String key, HttpSession session) {
		
		String loginok = (String)session.getAttribute("loginok");
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		
		ModelAndView mview = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today = java.sql.Date.valueOf(sdf.format(new Date()));
		
		ProjectDTO dto = service.getData(idx);
		
		String pymDate1 = service.getPaymentDate(idx).substring(0,4);
		String pymDate2 = service.getPaymentDate(idx).substring(5,7);
		String pymDate3 = service.getPaymentDate(idx).substring(8,10);
		float totalAmount = dto.getTotal_amount();
		float targetAmount = dto.getTarget_amount();
		int percentageAchieved = (int)Math.round((totalAmount / targetAmount * 100));
		
		mview.addObject("pymDate1", pymDate1);
		mview.addObject("pymDate2", pymDate2);
		mview.addObject("pymDate3", pymDate3);
		mview.addObject("dto", dto);
		mview.addObject("today", today);
		mview.addObject("name", name);
		mview.addObject("percentageAchieved", percentageAchieved);
		
		mview.setViewName("/project_detail/projectDetail");
		
		return mview;
	}
	
	@GetMapping("/project/payment")
	public ModelAndView getPaymentData(int idx, String key, HttpSession session) {
		
		String loginok = (String)session.getAttribute("loginok");
		String id = (String)session.getAttribute("id");
		String email = service.getEmail(id);
		String hp = service.getPhonNumber(id);
		
		ModelAndView mview = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today = java.sql.Date.valueOf(sdf.format(new Date()));
		
		String pymDate1 = service.getPaymentDate(idx).substring(0,4);
		String pymDate2 = service.getPaymentDate(idx).substring(5,7);
		String pymDate3 = service.getPaymentDate(idx).substring(8,10);
		
		ProjectDTO dto = service.getData(idx);
		
		mview.addObject("pymDate1", pymDate1);
		mview.addObject("pymDate2", pymDate2);
		mview.addObject("pymDate3", pymDate3);
		mview.addObject("dto", dto);
		mview.addObject("today", today);
		mview.addObject("email", email);
		mview.addObject("hp", hp);
		
		mview.setViewName("/project_detail/payment");
		
		return mview;
	}
	
}
