package data.profile;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberMapper;
import data.member.MemberService;
import data.project.ProjectDTO;
import data.project.ProjectMapper;
import data.project.ProjectService;

@Controller
//@RequestMapping("/profile")
public class ProfileController {
	
	@Autowired
	MemberMapper memMapper;
	@Autowired
	ProfileService profileService;
	@Autowired
	MemberService memberService;
	@Autowired
	ProjectService projectService;
	@Autowired
	ProjectMapper pmapper;
	
//	상대방 프로필로 이동
	@PostMapping("/comment/profile")
	public String moveToProfile(Model model, String id) {
		
		MemberDTO movedto = memberService.getAll(id);
		model.addAttribute("id",id); //원섭
		model.addAttribute("movedto", movedto);
		
		return "/profile/introduction";
	}
	@PostMapping("/comment/sponsored")
	public String moveToS(Model model, String id) {
		
		MemberDTO movedto = memberService.getAll(id);
		model.addAttribute("id",id); //원섭
		model.addAttribute("movedto", movedto);
		
		return "/profile/sponsoredProject";
	}
	
	
//	소개
	@GetMapping("/profile")
	public String introduction (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String loginok = (String)session.getAttribute("loginok");
		
		if(loginok == null) {
			return "redirect:/login/main";
			
		} else {
			MemberDTO dto = memberService.getAll(id);
			model.addAttribute("dto", dto);
			
			//String url = memMapper.getUrl(id);
			String photo = dto.getPhoto();
			model.addAttribute("photo", photo);
			
			return "/profile/introduction";
		}
		
	}

	
//	후원한 프로젝트
	@GetMapping("/profile/backed")
	public String sponsoredList (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		//System.out.println(name);
		MemberDTO dto = memberService.getAll(id);
		String photo = dto.getPhoto();
		
		model.addAttribute("dto", dto);
		model.addAttribute("photo", photo);
		model.addAttribute("name", name);
		
		return "/profile/sponsoredProject";
	}
	
//	내가 올린 프로젝트
	@GetMapping("/profile/created")
	public ModelAndView uploadeList (HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		//System.out.println("창작자: "+name);
		MemberDTO dto = memberService.getAll(id);
		String photo = dto.getPhoto();
		
		List<ProjectDTO> creativeList = profileService.getCreativeProject(name);
		//System.out.println("창작한 리스트: "+creativeList);
		//System.out.println("창작한 갯수: "+creativeList.size());
		
		mview.addObject("dto", dto);
		mview.addObject("photo", photo);
		
		mview.addObject("name", name);
		mview.addObject("creativeList", creativeList);
		mview.addObject("creativeCont", creativeList.size());
		mview.setViewName("/profile/uploadedProject");
		return mview;
	}
	
//	내가 올린 프로젝트 삭제 -사진삭제 추가하기
	@GetMapping("/profile/created/delete")
	@ResponseBody
	public void delete(@RequestParam String idx, HttpSession session) {
		
		// 실제 업로드 폴더의 경로
		String path = session.getServletContext().getRealPath("/thumbnail_image");
		//System.out.println(path);
		
		// 업로드된 파일명
		ProjectDTO pdto = projectService.getData(idx);
		String thumbnail = pdto.getThumbnail();
		//System.out.println(thumbnail);
		// file 객체 생성
		File file = new File(path +"\\"+ thumbnail);
		// 파일 삭제
		file.delete();
		
		
		profileService.deleteCreativeProject(idx);
		
	}
	
	
	
//	관심있는 프로젝트
	@GetMapping("/profile/liked")
	public String interestList (HttpSession session, Model model) {
		
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		//System.out.println(name);
		MemberDTO dto = memberService.getAll(id);
		String photo = dto.getPhoto();
		
		model.addAttribute("dto", dto);
		model.addAttribute("photo", photo);
		model.addAttribute("name", name);
		
		return "/profile/projectInterest";
	}
	
//	올린 프로젝트 관리 디테일 페이지
	@GetMapping("/profile/created/management")
	public ModelAndView getProject (@RequestParam String idx) {
		
		ModelAndView mview = new ModelAndView();
		//ProjectDTO dto = profileService.getProject(idx);
		ProjectDTO pdto = projectService.getData(idx);
		//System.out.println("idx: "+idx);
		String thumbnail = pdto.getThumbnail();
		System.out.println(thumbnail);
		
		mview.addObject("pdto", pdto);
		mview.addObject("thumbnail", thumbnail);
		mview.setViewName("/profile/uploadedProjectModify");
		
		
		return mview;
	}

	
}
