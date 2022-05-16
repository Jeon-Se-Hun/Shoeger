package aaa.service.admin.order;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.OrderDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.OrderService_Ad;
@Service
public class Check_Ad implements OrderService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		
		controlDTO.getSchDTO().setKind("매입");

		controlDTO.getPageDTO().init(mm.ooListCnt(controlDTO));
		List<OrderDTO> oolist = mm.ooList(controlDTO);
		
		res.put("list", oolist);
		res.put("pageDTO", controlDTO.getPageDTO());
		return res;
	}
	
}
