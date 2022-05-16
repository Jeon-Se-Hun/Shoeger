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
import aaa.service.admin.ShopService_Ad;

@Service
public class Return_Ad implements OrderService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		
//		controlDTO.getSchDTO().setKind("취소");
//		int cnt = mm.ooListCnt(controlDTO);
//		controlDTO.getSchDTO().setKind("환불");
//		cnt += mm.ooListCnt(controlDTO);
//		
		
		
		controlDTO.getPageDTO().init(mm.ooListCanCnt(controlDTO));
//		List<OrderDTO> buflist = mm.ooList(controlDTO);
//		controlDTO.getSchDTO().setKind("취소");
		List<OrderDTO> oolist = mm.ooListCan(controlDTO);
		
//		oolist.addAll(buflist);
		
		
		
		res.put("list", oolist);
		res.put("pageDTO", controlDTO.getPageDTO());
		return res;
	}

	
}
