package aaa.service;

import java.util.HashMap;
import java.util.List;

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
public class Sellregcomp implements ContentService {

	@Resource
	ViewMapper vm;

	@Resource
	ClientMapper cm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		poDTO.setPid((String) session.getAttribute("sessionId"));
		cDTO.setPid((String) session.getAttribute("sessionId"));
		map.put("session", cDTO);

		vm.newsell(poDTO);

		return map;
	}

}
