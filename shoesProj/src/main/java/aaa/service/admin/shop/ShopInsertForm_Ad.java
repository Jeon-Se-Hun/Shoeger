package aaa.service.admin.shop;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class ShopInsertForm_Ad implements ShopService_Ad {
	
	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		return null;
	}

}
