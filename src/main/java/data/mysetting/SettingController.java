package data.mysetting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SettingController {
	
	@GetMapping("/setting/main")
	public String home() {
		return "/mypage_setting/settingForm";
	}

}
