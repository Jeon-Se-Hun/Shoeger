package aaa.controll;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.github.scribejava.core.model.OAuth2AccessToken;

import aaa.model.NaverLoginAction;
import aaa.service.HomeService;
import aaa.service.MyProvider;

@Controller
public class LoginController {
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Resource
	MyProvider myProvider;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping(value = "/shoeger/naver_login", method = { RequestMethod.POST, RequestMethod.GET} )
	public String login(Model model, HttpSession session) {

		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		model.addAttribute("url", naverAuthUrl);
		return "/shoeger/member/naver_login";
	}

	@RequestMapping(value = "/shoeger/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		JSONObject response_obj = (JSONObject) jsonObj.get("response");

		NaverLoginAction res = myProvider.getContext().getBean("naverReg", NaverLoginAction.class);
		String pid = res.execute(response_obj) + "";
		
		if(pid.equals("탈퇴")) {
			return "/alert";
		}
		
		session.setAttribute("sessionId", pid);
		
		HomeService hservice = myProvider.getContext().getBean("visitService", HomeService.class);
		hservice.execute(request, session);

		model.addAttribute("result", apiResult);
		
		return "/homeee";
	}

	@RequestMapping(value = "/shoeger/member/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session, Model model) throws IOException {
		
		session.invalidate();
		
		return "/homeee";
	}
}
