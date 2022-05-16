package aaa.service.admin.member;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.MemberService_Ad;


@Service
public class MemberList_Ad implements MemberService_Ad{
	
	@Resource
	AdminMapper mm;

	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		/*
		 * res.put("pDTO",(PageDTO)map.get("pDTO"));
		 * res.put("ccDTO",(ClientDTO)map.get("ccDTO"));
		 */
		
		
		
		controlDTO.getPageDTO().init(0);
		List<ClientDTO> cclist = mm.cclist(controlDTO);
		controlDTO.getPageDTO().init(mm.cclistCnt(controlDTO));
		res.put("list", cclist);
		res.put("pageDTO", controlDTO.getPageDTO());
		
		return res;
	}

	
}
