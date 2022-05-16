package aaa.controll;

import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.model.ClientAction;
import aaa.model.ClientDTO;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;
import aaa.service.CertificationService;
import aaa.service.ContentService;
import aaa.service.MyProvider;

@Controller
public class CheckController {
	@Resource
	MyProvider myProvider;

	@RequestMapping("/{service}.do")
	@ResponseBody
	Object login(@RequestBody ClientDTO cDTO, @PathVariable String service) {
		ClientAction res = myProvider.getContext().getBean(service + "Reg", ClientAction.class);
		return res.execute(cDTO);
	}

	@RequestMapping("/searchProd.do")
	@ResponseBody
	Object search(@RequestBody MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
		
		ContentService res = myProvider.getContext().getBean("searchProd", ContentService.class);
		
		return res.execute(mDTO, sDTO, cDTO, session, wDTO, poDTO, spDTO);
	}

	@RequestMapping("/check/sendSMS")
	@ResponseBody
	public String sendSMS(String phoneNumber) {

		Random rand = new Random();
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		
		CertificationService certificationService = new CertificationService();

		System.out.println("수신자 번호 : " + phoneNumber);
		System.out.println("인증번호 : " + numStr);
		certificationService.certifiedPhoneNumber(phoneNumber, numStr);
		return numStr;
	}
	
}
