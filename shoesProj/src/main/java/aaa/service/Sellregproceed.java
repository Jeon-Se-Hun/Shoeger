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

@Service
public class Sellregproceed implements ContentService {

	@Resource
	ClientMapper cm;

	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO,
			PorderDTO poDTO, ShopPageDTO spDTO) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		String msg = "판매신청을 진행하시겠습니까?";
		String pid = (String) session.getAttribute("sessionId");
		cDTO.setPid(pid);
		poDTO.setPid(pid);

		map.put("session", cDTO);

		List<PorderDTO> list = cm.sale1(cDTO);
		for (PorderDTO poModel : list) {
			if (poModel.getModel() == null || poModel.getModel().equals("")) {
				msg = "판매신청을 진행하시겠습니까?";
			} else if (poModel.getModel().equals(poDTO.getModel())) {
				msg = "회원님이 이전에 판매한 기록이 있는 모델입니다. 동인한 모델의 상품을 추가로 판매하시겠습니까?";
			}
		}

		map.put("msg", msg);
		map.put("poDTO", poDTO);

		return map;
	}

}
