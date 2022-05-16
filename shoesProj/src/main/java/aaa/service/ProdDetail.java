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
public class ProdDetail implements ContentService {

	@Resource
	ViewMapper vm;

	@Resource
	ClientMapper cm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		boolean already = false;

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("prodInfo", vm.prodInfo(sDTO));
		map.put("realimg", vm.stockInfo(sDTO));
		map.put("session", session.getAttribute("sessionId"));
		cDTO.setPid((String) session.getAttribute("sessionId"));
		map.put("wlist", cm.miniwish(cDTO));
		String brand = vm.schBrand(mDTO.getModel());
		mDTO.setBrand(brand);
		map.put("recList", vm.recList(mDTO));
		map.put("session", cDTO);

		for (WishDTO ww : cm.miniwish(cDTO)) {
			if (ww.getNum().equals(sDTO.getProductid())) {
				already = true;
			}
		}

		map.put("already", already);

		return map;
	}

}
