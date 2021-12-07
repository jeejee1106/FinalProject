package data.email;

import java.util.HashMap;
import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import data.member.MemberDTO;
import data.member.MemberService;

@Service
public class EmailServiceImpl{
	
	@Autowired
	JavaMailSender emailSender;
	
	@Autowired
	MemberService memberService;
	
	public static final String ePw = createKey();
	
	 private MimeMessage createMessage(String to)throws Exception{
		 MimeMessage  message = emailSender.createMimeMessage();
		 	
		 	message.addRecipients(RecipientType.TO, to);//보내는 대상
	        message.setSubject("bunddeuk 이메일 인증 링크가 도착했습니다.");//제목
	        
	        String msgg="";
	        msgg+= "<div style='margin:100px;'>";
	       	msgg+= "<h1> 안녕하세요  bunddeuk입니다 </h1>";
	        msgg+= "<br>";
	        msgg+= "<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.<p>";
	        msgg+= "<br>";
	        msgg+= "<p>감사합니다!<p>";
	        msgg+= "<br>";
			msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
			msgg+= "<div style='font-size:130%'>";
			msgg+= "<a href=\"http://localhost:9002/setting/verifyCode?email="+to+"&authKey="+ePw+"\" target='_blenk' style=\"text-align: center; : 20px; text-decoration: none; padding:10px 20px; color: red; font-size:14px;\">이메일 인증하기</a>";
			msgg+= "</div>";
	        message.setText(msgg, "utf-8", "html");//내용
	        message.setFrom(new InternetAddress("xptmxmaksgo@gmail.com","bunddeuk"));//보내는 사람
	        
	        
	        
	        return message;
	        
	    }
	 
	 private MimeMessage createPassMessage(String email)throws Exception{
			 System.out.println("보내는 대상 : "+ email);
			 System.out.println("인증 번호 : "+ePw);
			 MimeMessage  message = emailSender.createMimeMessage();
		 	
		 	message.addRecipients(RecipientType.TO, email);//보내는 대상
	        message.setSubject("bunddeuk 임시 비밀번호가 도착했습니다.");//제목
	        
	        String msgg="";
	        msgg+= "<div style='margin:100px;'>";
	       	msgg+= "<h1> 안녕하세요  bunddeuk입니다 </h1>";
	        msgg+= "<br>";
	        msgg+= "<p>임시 비밀번호 발급<p>";
	        msgg+= "<br>";
	        msgg+= "<p>감사합니다!<p>";
	        msgg+= "<br>";
			msgg+= "<div align='center' style='border:1px solid black; font-family:verdana';>";
			msgg+= "<h3 style='color:blue;'>임시 비밀번호입니다.</h3>";
			msgg+= "<div style='font-size:130%'>";
			msgg+= "CODE : <strong>";
			msgg+= ePw+"</strong><div><br/> ";
			msgg+= "</div>";
	        message.setText(msgg, "utf-8", "html");//내용
	        message.setFrom(new InternetAddress("xptmxmaksgo@gmail.com","bunddeuk"));//보내는 사람
	        
	       	MemberDTO dto = memberService.memberByEmail(email);
			
	       	dto.setPass(ePw);
			
			memberService.updateEmailPass(dto);
	        
	        return message;
	        
	    }
	 
//		인증코드 만들기
		public static String createKey() {
			StringBuffer key = new StringBuffer();
			Random rnd = new Random();

			for (int i = 0; i < 10; i++) { // 인증코드 10자리
				int index = rnd.nextInt(3); // 0~2 까지 랜덤

				switch (index) {
				case 0:
					key.append((char) ((int) (rnd.nextInt(26)) + 97));
					//  a~z  (ex. 1+97=98 => (char)98 = 'b')
					break;
				case 1:
					key.append((char) ((int) (rnd.nextInt(26)) + 65));
					//  A~Z 
					break;
				case 2:
					key.append((rnd.nextInt(10)));
					// 0~9
					break;
				}
			}

			return key.toString();
		}

		

		 public void sendSimpleMessage(String to)throws Exception {
		        MimeMessage message = createMessage(to);
		        try{//예외처리
		            emailSender.send(message);
		        }catch(MailException es){
		            es.printStackTrace();
		            throw new IllegalArgumentException();
		        }
		    }
		 
		 public void sendPassMessage(String to)throws Exception {
		        MimeMessage message = createPassMessage(to);
		        try{//예외처리
		            emailSender.send(message);
		        }catch(MailException es){
		            es.printStackTrace();
		            throw new IllegalArgumentException();
		        }
		    }


}