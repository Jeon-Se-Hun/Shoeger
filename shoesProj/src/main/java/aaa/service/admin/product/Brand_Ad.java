package aaa.service.admin.product;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.ProductService_Ad;
import aaa.service.admin.ShopService_Ad;

@Service
public class Brand_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		controlDTO.getPageDTO().init(mm.brandDTOCnt(controlDTO));
		res.put("brand", mm.brandList());
		res.put("list", mm.brandDTOList(controlDTO));
		res.put("pageDTO", controlDTO.getPageDTO());
		
		return res;
	}

	
}
