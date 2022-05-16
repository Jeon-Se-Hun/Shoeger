package aaa.service.admin.shop;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class ShopMemberdetail_Ad implements ShopService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		res.put("mmList", mm.memberdetail(controlDTO.getCcDTO()));
		return res;
	}

	
}
