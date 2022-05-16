package aaa.controll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InterceptorController {
	@RequestMapping("/intercepter/fail")
	String fail() {
		return "intercepter/fail";
	}
	
}
