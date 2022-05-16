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
public class Buy_Ad implements OrderService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		controlDTO.getSchDTO().setKind("매출");
		controlDTO.getPageDTO().init(0);
		List<OrderDTO> oolist = mm.ooList(controlDTO);
		controlDTO.getPageDTO().init(mm.ooListCnt(controlDTO));
		

		res.put("list", oolist);
		res.put("pageDTO", controlDTO.getPageDTO());
		return res;
	}

	
}
