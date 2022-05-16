package aaa.service;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;
import aaa.model.db.ViewMapper;


@Service
public class Mainview implements ContentService{

	@Resource
	ViewMapper vm;

	@Resource
	ClientMapper cm;
	
	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("popular", vm.popularlist(mDTO));
		map.put("recent", vm.recentlist(mDTO));
		map.put("new", vm.newlist(mDTO));
		cDTO.setPid((String)session.getAttribute("sessionId"));
		map.put("session", cDTO);
		map.put("wlist", cm.miniwish(cDTO));
		map.put("bottom", cm.shopInfo());
		
		return map;
	}
	
}
