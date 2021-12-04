package data.profile;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import data.member.MemberDTO;
import data.member.MemberMapper;
import data.member.MemberService;
import data.project.DetailService;
import data.project.ProjectDTO;
import data.project.ProjectMapper;
import data.project.ProjectService;
import data.support.SupportDTO;
import data.support.SupportService;

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
	ProjectMapper projectMapper;
	@Autowired
	DetailService detailService;
	
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
		
		List<SupportDetailDTO> supportLsit = profileService.getSupportProject(id);
		
		model.addAttribute("dto", dto);
		model.addAttribute("name", name);
		model.addAttribute("supportLsit", supportLsit);
		model.addAttribute("count", supportLsit.size());
		//System.out.println("후원한리스트"+supportLsit);
		
		return "/profile/sponsoredProject";
	}
//	후원한 성공 디테일
	@GetMapping("/profile/support_success")
	public ModelAndView sponsoredSuccessDetail (@RequestParam String num, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		
		ModelAndView mview = new ModelAndView();
		SupportDetailDTO sdto = profileService.getSupportData(num);
		mview.addObject("sdto", sdto);
		mview.setViewName("/profile/sponsoeredDetail");
		
		return mview;
		
	}
	
//	후원한 프로젝트 삭제
	@ResponseBody
	@GetMapping("/profile/support_cancel")
	public void supportCancel(@RequestParam String num) {
		
		profileService.deleteSupport(num);
	}
	
//	내가 올린 프로젝트
	@GetMapping("/profile/created")
	public ModelAndView uploadeList (HttpSession session) {
		
		ModelAndView mview = new ModelAndView();
		String id = (String)session.getAttribute("id");
		String name = memMapper.getName(id);
		//System.out.println("창작자: "+name);
		MemberDTO dto = memberService.getAll(id);
		
		List<ProjectDTO> creativeList = profileService.getCreativeProject(name);
		//System.out.println("창작한 리스트: "+creativeList);
		//System.out.println("창작한 갯수: "+creativeList.size());
		
		mview.addObject("dto", dto);
		mview.addObject("name", name);
		mview.addObject("creativeList", creativeList);
		mview.addObject("creativeCont", creativeList.size());
		mview.setViewName("/profile/uploadedProject");
		return mview;
	}
	
//	내가 올린 프로젝트 삭제 -사진삭제 추가하기
	@GetMapping("/profile/created_delete")
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
	
//	올린 프로젝트 관리 디테일 페이지
	@GetMapping("/profile/created_management")
	public ModelAndView getProject (@RequestParam String idx) {
		
		ModelAndView mview = new ModelAndView();
		//ProjectDTO dto = profileService.getProject(idx);
		ProjectDTO pdto = projectService.getData(idx);
		//System.out.println("idx: "+idx);
		//System.out.println(pdto.getThumbnail());
		
		mview.addObject("pdto", pdto);
		mview.setViewName("/profile/uploadedProjectModify");
		
		
		return mview;
	}
	
//	관심있는 프로젝트
	@GetMapping("/profile/liked")
	public String interestList (HttpSession session, Model model, String idx) {
		
		String id = (String)session.getAttribute("id");
		String name = memberService.getName(id);
		//System.out.println(name);
		MemberDTO dto = memberService.getAll(id);
		
		List<LikedDTO> likeList = profileService.getLikedProject(id);
		ProjectDTO pdto = projectService.getData(idx);
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		Date today = Date.valueOf(sdf.format(new java.util.Date()));
//		float totalAmount = pdto.getTotal_amount();
//		float targetAmount = pdto.getTarget_amount();
//		int percentageAchieved = (int)Math.round((totalAmount / targetAmount * 100));
		
		model.addAttribute("likeList", likeList);
		model.addAttribute("likecount", likeList.size());
		model.addAttribute("dto", dto);
		model.addAttribute("name", name);
//		model.addAttribute("today", today);
//		model.addAttribute("percentageAchieved", percentageAchieved);
//		System.out.println(percentageAchieved);
		
		return "/profile/projectInterest";
	}
	
//	관심 프로젝트 삭제
	@GetMapping("/profile/liked_delete")
	@ResponseBody
	public void deleteLiked (@RequestParam String num) {
		
		profileService.deleteLikedProject(num);
	}
	
}
