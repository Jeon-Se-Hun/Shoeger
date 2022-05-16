package aaa.controll;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import aaa.service.HomeService;
import aaa.service.MyProvider;

@Controller
public class HomeController {
	
	@Resource
	MyProvider myProvider;
	
	@RequestMapping("/shoeger")
	public String home(HttpServletRequest request, HttpSession session) {
		
		HomeService res = myProvider.getContext().getBean("visitService", HomeService.class);
		res.execute(request, session);
		
		return "homeee";
	}
	
}        

