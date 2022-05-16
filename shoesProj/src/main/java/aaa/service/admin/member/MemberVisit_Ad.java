package aaa.service.admin.member;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionListener;

import org.springframework.stereotype.Service;

import aaa.model.VisitorDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.MemberService_Ad;

@Service
public class MemberVisit_Ad implements MemberService_Ad, HttpSessionListener {
	
	@Resource
	AdminMapper mm;

	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		controlDTO.getPageDTO().init(0);
		List<VisitorDTO> vvlist = mm.visitlist(controlDTO);
		controlDTO.getPageDTO().init(mm.visitlistCnt(controlDTO));
		res.put("vvDTO", vvlist);
		
		res.put("pageDTO", controlDTO.getPageDTO());
		
		return res;
	}

	
}
