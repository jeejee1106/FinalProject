package data.mysetting;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberService;

@Controller
public class SettingController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/setting/main")
	public ModelAndView home(HttpSession session, Model model) {
		
		ModelAndView mview = new ModelAndView();
		
		String id = (String) session.getAttribute("id");
		
		MemberDTO dto = service.getAll(id);
		
		mview.addObject("dto", dto);
		mview.setViewName("/mysetting/settingForm");
		return mview;
		
	} 
	
	@PostMapping("/setting/updatephoto")
	public String updatePhoto(@RequestParam MultipartFile file,@ModelAttribute MemberDTO dto, HttpSession session) {
		
		
		//업로드할 폴더 지정
		String path = session.getServletContext().getRealPath("/photo");
		//업로드할 파일명
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		//업로드 안한경우
		if(file.getOriginalFilename().equals("")) {
			dto.setPhoto(null);
		}else {//업로드한 경우
			
			//업로드된 파일명
			String uploadfileName = service.getMember(dto.getNum()).getPhoto();
			//File 객체 생성
			File file2 = new File(path + "\\" + uploadfileName);
			//파일 삭제
			file2.delete();
			
			
			String uploadfile = "f" + sdf.format(new Date()) + file.getOriginalFilename();
			dto.setPhoto(uploadfile);
			
			//실제 업로드
			try {
				file.transferTo(new File(path + "\\" + uploadfile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//수정
		service.updateMemberPhoto(dto);
		return "redirect:main";
	}
	
	@PostMapping("/setting/updatename")
	public String updateName(@ModelAttribute MemberDTO dto) {
		
		service.updateMemberName(dto);
		return "redirect:main";
	}
	
	@PostMapping("/setting/updateurl")
	public String updateUrl(@ModelAttribute MemberDTO dto) {
		
		service.updateMemberUrl(dto);
		return "redirect:main";
	}
	
	@PostMapping("/setting/updateintroduce")
	public String updateIntroduce(@ModelAttribute MemberDTO dto) {
		
		service.updateMemberIntroduce(dto);
		return "redirect:main";
	}
	
	@PostMapping("/setting/updatepass")
	public String updatePass(@ModelAttribute MemberDTO dto) {
		
		service.updateMemberPass(dto);
		return "redirect:main";
	}
	
	@PostMapping("/setting/updatehp")
	public String updateHp(@ModelAttribute MemberDTO dto) {
		service.updateMemberHp(dto);
		return "redirect:main";
	}
	
	
	@GetMapping("/setting/leave")
	public String leave()
	{
		return "/mysetting/leave";
	}
	
	@GetMapping("/setting/validation")
	public ModelAndView validation(HttpSession session, Model model)
	{
		
	ModelAndView mview = new ModelAndView();
		
		String id = (String) session.getAttribute("id");
		
		MemberDTO dto = service.getAll(id);
		
		mview.addObject("dto", dto);
		mview.setViewName("/mysetting/validation");
		return mview;
		
	}
	

}
