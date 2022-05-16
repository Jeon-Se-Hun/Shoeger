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
public class Kakaopay implements ContentService {

	@Resource
	ViewMapper vm;

	@Resource
	ClientMapper cm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		System.out.println(cDTO.getPid());
		System.out.println(mDTO.getTotalPrice());
		System.out.println(sDTO.getProductid());
		System.out.println(poDTO.getPointuse());

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cDTO", cDTO);
		map.put("mDTO", mDTO);
		map.put("sDTO", sDTO);
		map.put("poDTO", poDTO);

		return map;
	}

}
