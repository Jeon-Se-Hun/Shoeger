package aaa.service;

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

@Service
public class Wishreg implements ContentService {

	@Resource
	ClientMapper cm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		System.out.println(session.getAttribute("sessionId"));
		System.out.println(sDTO.getModel());
		System.out.println(sDTO.getProductid());
		wDTO.setPid((String) session.getAttribute("sessionId"));
		wDTO.setModel(sDTO.getModel());
		wDTO.setNum(sDTO.getProductid());

		cm.newwish(wDTO);

		return null;
	}

}
