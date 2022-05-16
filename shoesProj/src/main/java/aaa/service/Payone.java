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
public class Payone implements ContentService {

	@Resource
	ClientMapper cm;

	@Resource
	ViewMapper vm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		String pid = (String) session.getAttribute("sessionId");

		cDTO.setPid(pid);

		sDTO.setModel(mDTO.getModel());
		HashMap<String, Object> map = new HashMap<>();
		map.put("session", cDTO);
		map.put("clientInfo", cm.client(cDTO));
		String cdnb = cm.client(cDTO).getCardnum();
		String[] cardnumber = new String[4];
		if (cdnb != null && !cdnb.equals("")) {
			cardnumber[0] = cdnb.substring(0, 4);
			cardnumber[1] = cdnb.substring(4, 8);
			cardnumber[2] = cdnb.substring(8, 12);
			cardnumber[3] = cdnb.substring(12);
			map.put("cardnum", cardnumber);
		}
		map.put("prodInfo", vm.prodInfo(sDTO));
		map.put("stockInfo", vm.stockInfo(sDTO));
		cDTO.setPid((String) session.getAttribute("sessionId"));
		map.put("wlist", cm.miniwish(cDTO));

		return map;
	}

}