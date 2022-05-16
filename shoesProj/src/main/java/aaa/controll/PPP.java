package aaa.controll;

import java.io.IOException;
import java.text.ParseException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import aaa.model.ClientAction;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.PPPData;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;
import aaa.model.db.ViewMapper;
import aaa.service.ContentService;
import aaa.service.MyProvider;
import aaa.service.Shop;

@Controller
@RequestMapping("/shoeger/{cate}/{service}")
public class PPP {

	@Resource
	MyProvider myProvider;

	@Resource
	ClientMapper client;
	
	@Resource
	ViewMapper vm;

	  @ModelAttribute
	   PPPData pppData(@PathVariable String cate, @PathVariable String service) {
	      PPPData ppp = new PPPData(cate, service);

	      if (service.endsWith("Reg")) {
	         return new PPPData("member", "login");
	      }

	      return ppp;
	   }

	@ModelAttribute("data")
	Object ddd(@PathVariable String service, ClientDTO cDTO) {

		if (service.endsWith("Reg")) {
			ClientAction res = myProvider.getContext().getBean(service, ClientAction.class);
			return res.execute(cDTO);
		}

		return null;
	}

	@ModelAttribute("mainData")
	Object mainData(@PathVariable String service, MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
		
		if(service.equals("shop") || service.equals("thatList") || service.equals("prodDetail") || service.equals("mainview") || service.equals("payone") || service.equals("payreg") || service.equals("miniwish") || service.equals("wishreg") || service.equals("sellrequest") || service.equals("sellreg") || service.equals("sellregcomp") || service.equals("sellregproceed") || service.equals("kakaopay") )  {
			
			ContentService cs = myProvider.getContext().getBean(service, ContentService.class);
			
			return cs.execute(mDTO, sDTO, cDTO, session, wDTO, poDTO, spDTO);
		}
		return null;
	}

	// 검색 기능?
	@ModelAttribute("schData")
	Object schData(MainDTO mDTO , StockDTO sDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ClientDTO cDTO, ShopPageDTO spDTO) {
		ContentService cs = myProvider.getContext().getBean("mainview", ContentService.class);
		return cs.execute(mDTO, sDTO, cDTO, session, wDTO, poDTO, spDTO);
	}

	@RequestMapping
	String view() {
		return "shoeger/template";
	}
}
