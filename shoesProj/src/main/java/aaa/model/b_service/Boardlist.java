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
import aaa.model.db.ListDTO;
import aaa.model.db.PageDTO;

@Service
public class Boardlist implements BoardAction {

	@Resource
	ClientMapper cc;

	@Override
	public Object execute(HashMap<String, Object> map) {

		// mybatis의 mapper 메소드 파라미터가 복수여서 map으로 묶음

		((PageDTO) map.get("pDTO")).init(cc, map);
		// 리턴으로 보내야 하는 객체가 여러개여서 하나의 객체 멤버변수로 묶음
		ListDTO res = new ListDTO();
		res.setBbs(cc.bblist(map));
		res.setBdto(((BoardDTO) map.get("bDTO")));
		res.setPdto(((PageDTO) map.get("pDTO")));

		ClientDTO cDTO = new ClientDTO();
		HttpSession session = ((HttpServletRequest) map.get("request")).getSession();

		res.setWlist(cc.miniwish(cDTO));

		return res;
	}

}
