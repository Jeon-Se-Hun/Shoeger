package aaa.model.b_service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import aaa.model.BoardDTO;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.db.BoardAction;
import aaa.model.db.PageDTO;

@Service
public class Boarddetail implements BoardAction {

	@Resource
	ClientMapper cc;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap();
		HttpSession session = ((HttpServletRequest) map.get("request")).getSession();
		ClientDTO cDTO = new ClientDTO();
		BoardDTO bDTO = (BoardDTO) map.get("bDTO");
		String ssId = session.getAttribute("sessionId") + "";
		BoardDTO detailDTO = cc.bbdetail(bDTO);

		if (!ssId.equals(detailDTO.getPid())) {
			cc.addCount(bDTO);
		}

		res.put("bDTO", detailDTO);
		res.put("pDTO", ((PageDTO) map.get("pDTO")));
		res.put("service", ((String) map.get("service")));

		cDTO.setPid(ssId);
		res.put("wlist", cc.miniwish(cDTO));

		return res;
	}

}
