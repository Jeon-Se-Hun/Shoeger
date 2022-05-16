package aaa.service.admin;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.ControllDTO;
import aaa.service.MyProvider;

@Service
public class Shop_Ad implements SubService_Ad {

	@Resource
	MyProvider myProvider;
	
	@Override
	public Object execute(String service, ControllDTO controlDTO) {
		
		
		ShopService_Ad ss = myProvider.getContext().getBean(service+"_Ad", ShopService_Ad.class);
		
		return ss.execute(controlDTO);
	}

}
