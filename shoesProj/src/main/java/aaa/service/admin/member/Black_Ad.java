package aaa.service.admin.member;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.SecessionDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.MemberService_Ad;

@Service
public class Black_Ad implements MemberService_Ad{
	
	@Resource
	AdminMapper mm;

	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();	
		
		
		controlDTO.getPageDTO().init(0);
		List<SecessionDTO> seclist = mm.seclist(controlDTO);
		controlDTO.getPageDTO().init(mm.seclistCnt(controlDTO));
		res.put("list", seclist);
		res.put("pageDTO", controlDTO.getPageDTO());
		
		return res;
	}

	
}
