package aaa.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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
import aaa.model.db.BrandDTO;
import aaa.model.db.MainDTO;
import aaa.model.db.ViewMapper;

@Service
public class Sellrequest implements ContentService {

	@Resource
	ViewMapper vm;

	@Resource
	ClientMapper cm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("session", session.getAttribute("sessionId"));

		ArrayList<String> brandname = new ArrayList<String>();

		List<BrandDTO> catelist = vm.catelist();

		cDTO.setPid((String) session.getAttribute("sessionId"));
		map.put("wlist", cm.miniwish(cDTO));

		for (BrandDTO a : catelist) {
			brandname.add(a.getEname());
		}
		map.put("brandname", brandname);

		cDTO.setPid((String) session.getAttribute("sessionId"));

		map.put("cliInfo", cm.client(cDTO));

		if (mDTO.getBrand() != null && !mDTO.getBrand().equals("")) {
			List<MainDTO> allprod = vm.allprod(mDTO);

			for (MainDTO a : allprod) {
				map.put(a.getBrand(), vm.eachmodel(a.getBrand()));
				/* map.put(a.getModel(), a.getImg1()); */
				map.put(a.getModel(), vm.modelinfo(a.getModel()));
			}

			return map;
		} else {

			return map;
		}

	}

}
