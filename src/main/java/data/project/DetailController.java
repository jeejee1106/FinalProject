package data.project;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberService;
import data.message.MessageService;
import data.mysetting.DeliveryDTO;
import data.mysetting.DeliveryService;

@Controller
public class DetailController {

	@Autowired
	DetailService service;
	@Autowired
	MessageService messageService;
	@Autowired
	MemberService memService;
	
	@GetMapping("/project/detail")
	public ModelAndView getDetailData(int idx, String key, HttpSession session) {
		
		String loginok = (String)session.getAttribute("loginok");
		String id = (String)session.getAttribute("id");
		String name = memService.getName(id);
		
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
		
		mview.addObject("pymDate", pymDate1 + "년 " + pymDate2 + "월 " + pymDate3 + "일");
		mview.addObject("dto", dto);
		mview.addObject("today", today);
		mview.addObject("name", name);
		mview.addObject("percentageAchieved", percentageAchieved);
		
		mview.setViewName("/project_detail/projectDetail");
		
		return mview;
	}
	
	@GetMapping("/project/payment")
	public ModelAndView getPaymentData(int idx, String key, HttpSession session) {
		ModelAndView mview = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today = java.sql.Date.valueOf(sdf.format(new Date()));
		
		String loginok = (String)session.getAttribute("loginok");
		String id = (String)session.getAttribute("id");
		
		ProjectDTO dto = service.getData(idx);
		MemberDTO mdto = memService.getAll(id);
		DeliveryDTO ddto = service.getAddr(id);
		
		String pymDate1 = service.getPaymentDate(idx).substring(0,4);
		String pymDate2 = service.getPaymentDate(idx).substring(5,7);
		String pymDate3 = service.getPaymentDate(idx).substring(8,10);
		float totalAmount = dto.getTotal_amount();
		float targetAmount = dto.getTarget_amount();
		int percentageAchieved = (int)Math.round((totalAmount / targetAmount * 100));
		String addr = ddto.getAddr();
		String addr2 = ddto.getAddr2();
		
		mview.addObject("pymDate", pymDate1 + "년 " + pymDate2 + "월 " + pymDate3 + "일");
		mview.addObject("dto", dto);
		mview.addObject("today", today);
		mview.addObject("percentageAchieved", percentageAchieved);
		mview.addObject("mdto", mdto);
		mview.addObject("addr", addr+ " " + addr2);
	
		
		mview.setViewName("/project_detail/payment");
		
		return mview;
	}
	
	@ResponseBody
	@PostMapping("/payment/hpUpdate")
	public String setHp(MemberDTO dto) {
		service.setHp(dto);
		return dto.getHp();
	}
	
	@ResponseBody
	@PostMapping("/payment/emailUpdate")
	public String setEmail(MemberDTO dto) {
		service.setEmail(dto);
		return dto.getEmail();
	}
	
	@ResponseBody
	@GetMapping("/payment/deliveryInsert")
public String deliveryInsert(DeliveryDTO ddto,HttpSession session) {
		
		String id = (String)session.getAttribute("id");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		
		service.insertDelivery(ddto);
		
		return ddto.getAddr() + " " + ddto.getAddr2();
		
	}
	
}
