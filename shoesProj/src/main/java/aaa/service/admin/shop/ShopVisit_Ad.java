package aaa.service.admin.shop;


import java.util.HashMap;

import org.springframework.stereotype.Service;

import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class ShopVisit_Ad implements ShopService_Ad{

	@Override
	public Object execute(ControllDTO controlDTO) {
		// TODO Auto-generated method stub
		return "방문자 데이터 입니다.";
	}

	
}
