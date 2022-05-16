package aaa.service;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;
import aaa.model.db.ViewMapper;
import aaa.service.ContentService;

@Service
public class SearchProd implements ContentService{

	@Resource
	ViewMapper vm;
	
	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", vm.searchProd(mDTO));
		cDTO.setPid((String)session.getAttribute("sessionId"));
		map.put("session", cDTO);

		return map;
	}

	
}
