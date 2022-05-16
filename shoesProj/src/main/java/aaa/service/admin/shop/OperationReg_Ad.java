package aaa.service.admin.shop;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.OperationDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class OperationReg_Ad implements ShopService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		// TODO Auto-generated method stub
		
		
		HashMap<String, Object> res = new HashMap<>();
		
		//mm.shopModify((ClientDTO)map.get("ccDTO"));
		res.put("msg", "변경되었습니다.");
		res.put("url", "shop/operation");
		
		mm.operinsert(controlDTO.getOperDTO());
		
		return res;
	}

	
}
