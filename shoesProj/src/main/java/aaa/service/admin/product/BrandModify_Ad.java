package aaa.service.admin.product;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.ProductService_Ad;

@Service
public class BrandModify_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		System.out.println(controlDTO.getBrandDTO());
		res.put("brandDTO", mm.brandDetail(controlDTO.getBrandDTO()));
		return res;
	}

	
}
