package aaa.controll;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import aaa.model.AdPageDTO;
import aaa.model.ClientDTO;
import aaa.model.PPPData;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;
import aaa.service.ContentService;
import aaa.service.MyProvider;
import aaa.service.myysalsService;

@Controller
@RequestMapping("shoeger/{cate}/{service}/{service2}")
public class MyPage {

	@Resource
	MyProvider myProvider;

	@RequestMapping
	public String mymain(@PathVariable String service2) {
		System.out.println("my 진입");

		if (service2.endsWith("Reg")) {
			return "shoeger/alert";
		} else if (service2.endsWith("Regcard")) {
			return "shoeger/alert";
		} else if (service2.endsWith("Regaccount")) {
			return "shoeger/alert";
		} else if (service2.endsWith("Regaddress")) {
			return "shoeger/alert";
		} else if (service2.endsWith("Regwish")) {
			return "shoeger/alert";
		} else if (service2.endsWith("Regporder")) {
			 return "shoeger/alert";
		} else if (service2.endsWith("Regdelcli")) {
			 return "shoeger/alert";
		}
		
		return "shoeger/template";
	}

	@ModelAttribute
	PPPData pppData(@PathVariable String cate, @PathVariable String service, @PathVariable String service2) {
		PPPData ppp = new PPPData(cate, service, service2);
		return ppp;
	}

	@ModelAttribute("clidata")
	Object aaa(@PathVariable String service2, ClientDTO cDTO, HttpSession session, String email, WishDTO wDTO, PorderDTO pDTO, AdPageDTO pageDTO) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		myysalsService res = myProvider.getContext().getBean("myy"+service2, myysalsService.class);
		
		cDTO.setPid((String) session.getAttribute("sessionId"));
		if (service2.endsWith("Regporder")) { // 취소신청
			 Date time = new Date();
			 pDTO.setPdate(time);
			 map.put("porder", pDTO);
		 }
		if (service2.endsWith("Regwish")) { // 관심상품 삭제
			map.put("wish", wDTO);
		}
		map.put("cDTO", cDTO);
		pageDTO.setLimit(4);
		map.put("pageDTO", pageDTO);
		return res.execute(map);
	}
	
	@ModelAttribute("schData")
	Object schData(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
		ContentService cs = myProvider.getContext().getBean("mainview", ContentService.class);
		return cs.execute(mDTO, sDTO, cDTO, session, wDTO, poDTO, spDTO);
	}

}