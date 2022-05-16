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
public class BoardmodifyForm implements BoardAction {

	@Resource
	ClientMapper cc;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap();

		res.put("bDTO", cc.bbdetail(((BoardDTO) map.get("bDTO"))));
		res.put("pDTO", ((PageDTO) map.get("pDTO")));
		ClientDTO cDTO = new ClientDTO();
		HttpSession session = ((HttpServletRequest) map.get("request")).getSession();
		cDTO.setPid((String) session.getAttribute("sessionId"));
		res.put("wlist", cc.miniwish(cDTO));

		return res;
	}

}