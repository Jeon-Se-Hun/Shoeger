package aaa.service.admin.product;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.ProductService_Ad;

@Service
public class ProductList_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();

		controlDTO.getPageDTO().init(mm.ppListCnt(controlDTO));
		List<ProductDTO> pplist = mm.ppList(controlDTO);
		
		System.out.println(pplist);
		System.out.println(mm.ppListCnt(controlDTO));
		System.out.println(controlDTO.getPageDTO());
		
		res.put("list", pplist);
		res.put("brand", mm.brandList());
		res.put("pageDTO", controlDTO.getPageDTO());
		
		return res;
	}

	
}
