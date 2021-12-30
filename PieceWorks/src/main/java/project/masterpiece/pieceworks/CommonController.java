package project.masterpiece.pieceworks;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

	@RequestMapping("common.com")
	public String test() {
		return "common-form";
	}	
	
}
