package aaa.service.admin.member;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.MemberService_Ad;

@Service
public class MemberDetail_Ad implements MemberService_Ad{
	
	@Resource
	AdminMapper mm;

	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		System.out.println(controlDTO.getCcDTO());
		res.put("ccDTO", mm.ccdetail(controlDTO.getCcDTO()));
		return res;
	}

	
}
