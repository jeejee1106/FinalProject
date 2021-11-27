package data.project;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
	public String inert(@ModelAttribute ProjectDTO dto) {
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
	
}

