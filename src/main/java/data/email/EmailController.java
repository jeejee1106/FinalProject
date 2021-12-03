package data.email;




import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberService;


@Controller
@RequestMapping("/setting/*")
public class EmailController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	EmailServiceImpl emailService;
	 
	 private static final Logger logger = LoggerFactory.getLogger(EmailController.class);
	 
		@PostMapping("/mail")
		@ResponseBody
		public void emailConfirm(MemberDTO dto)throws Exception{
			
			logger.info("post emailConfirm");
			System.out.println("전달 받은 이메일 : "+dto.getEmail());
			emailService.sendSimpleMessage(dto.getEmail());
			
			String authKey = emailService.ePw;
			dto.setAuthkey(authKey);
			
			memberService.updateMemberAuthkey(dto);
			
		}
		
		
	/*	@PostMapping("/verifyCode")
		@ResponseBody
		public int verifyCode(String code) {
			logger.info("Post verifyCode");
			
			int result = 0;
			System.out.println("code : "+code);
			System.out.println("code match : "+ EmailServiceImpl.ePw.equals(code));
			if(EmailServiceImpl.ePw.equals(code)) {
				result =1;
			}
			
			return result;
		}*/
		
		 @GetMapping("/verifyCode")
		 public String signUpConfirm(@RequestParam String email, String authKey, ModelAndView mav){
		    //email, authKey 가 일치할경우 authStatus 업데이트
			 MemberDTO dto = new MemberDTO();
			 
			 dto.setEmail(email);
			 dto.setAuthkey(authKey);
			 
		    memberService.updateMemberStatus(dto);
		    
		    return "redirect:main";
		}
}