package data.project;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProjectController {

	@Autowired
	ProjectService service;
	@Autowired
	ProjectMapper mapper;
	
	@GetMapping("/project/start")
	public String start () {
		return "/project_create/projectStart";
	}
	
	
	@PostMapping("/project/insert")
	public String inert(@ModelAttribute ProjectDTO dto,HttpSession session) {
		String id = (String)session.getAttribute("id");
		String loginok = (String) session.getAttribute("loginok");
		
		if(loginok == null) {
			return "/login/loginform";
		}
		
		dto.setId(id);
		service.insertCategory(dto);
		return "redirect:editor?idx=" + service.getMAxIdx();
	}
	
	@GetMapping("/project/editor")
	public ModelAndView editor(@RequestParam String idx) {
		ModelAndView mview = new ModelAndView();
		mview.addObject("idx", idx);
		mview.setViewName("/project_create/editor");
		
		return mview;
	}
	
	@PostMapping("/project/update")
	public String storyUpdate(@ModelAttribute ProjectDTO dto) {
		service.storyUpdate(dto);
		
		return "redirect:editor?idx=" + dto.getIdx();
	}
	

	
	
	@PostMapping("/project/defaultUpdate")
	public String defaultUpdate(@ModelAttribute ProjectDTO dto,HttpSession session) {

		String path = session.getServletContext().getRealPath("/thumbnail");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		if (dto.getUpload().getOriginalFilename().equals("")) {
			dto.setThumbnail(null);
		} else {
			String thumbnail = sdf.format(new Date()) + "_" + dto.getUpload().getOriginalFilename();
			dto.setThumbnail(thumbnail);

			try {
				dto.getUpload().transferTo(new File(path + "\\" + thumbnail));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		service.defaultUpdate(dto);
		return "redirect:editor?idx=" + dto.getIdx();
	}
	
	
	@ResponseBody
	@PostMapping("/project/fundingUpdate")
	public void fundingUpdate(@ModelAttribute ProjectDTO dto, @RequestParam int idx,
			@RequestParam int target_amount, @RequestParam java.sql.Date start_date,
			@RequestParam String time_start, @RequestParam java.sql.Date end_date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.sql.Date today = java.sql.Date.valueOf(sdf.format(start_date));
		java.sql.Date end_date2 = java.sql.Date.valueOf(sdf.format(end_date));
		
		dto.setIdx(idx);
		dto.setTarget_amount(target_amount);
		dto.setStart_date(today);
		dto.setEnd_date(end_date2);
		dto.setTime_start(time_start);
		service.fundingUpdate(dto);
	}
	/*
	 * submit일 경우 아래코드만 사용 가능
	 * @PostMapping("/project/fundingUpdate") public void
	 * fundingUpdate(@ModelAttribute ProjectDTO dto, @RequestParam int idx,
	 * 
	 * @RequestParam int target_amount, @RequestParam @DateTimeFormat(iso =
	 * ISO.DATE) java.sql.Date start_date,
	 * 
	 * @RequestParam String time_start, @RequestParam @DateTimeFormat(iso =
	 * ISO.DATE) java.sql.Date end_date) { dto.setIdx(idx);
	 * dto.setTarget_amount(target_amount); dto.setStart_date(start_date);
	 * dto.setEnd_date(end_date); dto.setTime_start(time_start);
	 * service.fundingUpdate(dto); }
	 */
	
	@ResponseBody
	@PostMapping("/project/policyUpdate")
	public void policyUpdate(@ModelAttribute ProjectDTO dto, @RequestParam int idx,
			@RequestParam String anticipated_problem) {
		dto.setAnticipated_problem(anticipated_problem);
		service.policyUpdate(dto);
	}
}

