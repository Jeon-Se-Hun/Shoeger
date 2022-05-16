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
import aaa.model.TradeDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;
import aaa.model.db.ViewMapper;

@Service
public class Payreg implements ContentService {

	@Resource
	ClientMapper cm;

	@Resource
	ViewMapper vm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		StockDTO sDTO1 = new StockDTO();
		TradeDTO tDTO = new TradeDTO();
		PorderDTO poDTO1 = new PorderDTO();

		String msg;

		sDTO1 = vm.stockInfo(sDTO);
		sDTO1.setTradeid(poDTO1.getTradeid());
		cDTO.setPid((String) session.getAttribute("sessionId"));
		map.put("wlist", cm.miniwish(cDTO));
		map.put("session", cDTO);

		String fchk = sDTO1.getSdate() + "";

		if (fchk.equals("null") || fchk == null || fchk.equals("")) {
			msg = "구매가 완료되었습니다.";
			poDTO.setPid(cDTO.getPid());
			poDTO.setModel(sDTO1.getModel());
			poDTO.setPrice(sDTO1.getSprice());
			poDTO.setTradeid(sDTO1.getTradeid());
			poDTO.setPsize(sDTO1.getPsize());


			int tradeprice = sDTO1.getSprice() - poDTO.getPointuse();
			cm.neworder(poDTO);

			tDTO.setPid(cDTO.getPid());
			tDTO.setPoint(poDTO.getPointuse());
			System.out.println("1111"+poDTO.getPointuse());
			tDTO.setPrice(tradeprice);
			tDTO.setTradeid(poDTO.getTradeid());
			cm.pointuse(poDTO);

			System.out.println("11112"+poDTO.getTradeid());

			vm.stocksell(sDTO);
			cm.newtrade(tDTO);
			map.put("msg", msg);
		} else {
			msg = "이미 판매된 상품입니다.";
			map.put("msg", msg);
		}

		return map;
	}

}