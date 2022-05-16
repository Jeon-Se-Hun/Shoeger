package aaa.controll.admin;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import aaa.model.AdPageDTO;
import aaa.model.BoardDTO;
import aaa.model.ClientDTO;
import aaa.model.Menu;
import aaa.model.OperationDTO;
import aaa.model.OrderDTO;
import aaa.model.ProductDTO;
import aaa.model.SecessionDTO;
import aaa.model.StockDTO;
import aaa.model.TradeDTO;
import aaa.model.VisitorDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.CsData;
import aaa.model.admin.SchDTO;
import aaa.model.db.BrandDTO;
import aaa.service.MyProvider;
import aaa.service.admin.SubService_Ad;

@Controller
@RequestMapping("/admin/template/{cate}/{service}")
public class AdminController {
	
	@Resource
	AdminMapper mm; 
	
	@Resource
	MyProvider myProvider;
	
	
	@ModelAttribute("mainData")
	Object mainData(@PathVariable String cate, @PathVariable String service, HttpServletRequest request,
			SchDTO schDTO, ClientDTO ccDTO, OperationDTO operDTO, ProductDTO ppDTO, OrderDTO ooDTO, 
			StockDTO ssDTO, BoardDTO bbDTO,TradeDTO ttDTO,VisitorDTO vvDTO, AdPageDTO pageDTO,
			SecessionDTO secDTO, BrandDTO brandDTO) {
		
		ControllDTO controlDTO = new ControllDTO();
		controlDTO.setRequest(request);
		controlDTO.setSchDTO(schDTO);
		controlDTO.setCcDTO(ccDTO);
		controlDTO.setOperDTO(operDTO);
		controlDTO.setPpDTO(ppDTO);
		controlDTO.setOoDTO(ooDTO);
		controlDTO.setSsDTO(ssDTO);
		controlDTO.setBbDTO(bbDTO);
		controlDTO.setTtDTO(ttDTO);
		controlDTO.setVvDTO(vvDTO);
		controlDTO.setPageDTO(pageDTO);
		controlDTO.setSecDTO(secDTO);
		controlDTO.setBrandDTO(brandDTO);

		SubService_Ad ss = myProvider.getContext().getBean(cate+"_Ad", SubService_Ad.class);
		
		return ss.execute(service, controlDTO);
	}
	
	@ModelAttribute("cateKr")
	String cateKr(@PathVariable String cate) {
		String res = "";
		switch (cate) {
		case "shop":
			res = "상점관리";
			break;
		case "product":
			res = "상품관리";
			break;
		case "order":
			res = "주문관리";
			break;
		case "member":
			res = "회원관리";
			break;
		case "board":
			res = "게시판관리";
			break;
		}
		return res;
	}
	
	@ModelAttribute
	CsData csData(@PathVariable String cate, @PathVariable String service) {
		return new CsData(cate, service);
	}
	
	@ModelAttribute("subMenu")
	List<Menu> subMenu(@PathVariable String cate) {
		return mm.getAdminMenu(cate);
	}
	
	@RequestMapping
	String managerView(@PathVariable String service) {
		
		if(service.endsWith("Reg")) {
			return "admin/alert";
		}
		
		return "admin/template";
	}
	
}
