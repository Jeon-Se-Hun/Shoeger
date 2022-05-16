package aaa.service.admin.member;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.MemberService_Ad;

@Service
public class BlackDetail_Ad implements MemberService_Ad{
	
	@Resource
	AdminMapper mm;

	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		res.put("secDTO", mm.secdetail(controlDTO.getSecDTO()));
		
		return res;
	}

	
}
