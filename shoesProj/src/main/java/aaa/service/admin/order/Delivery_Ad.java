package aaa.service.admin.order;


import java.util.HashMap;

import org.springframework.stereotype.Service;

import aaa.model.admin.ControllDTO;
import aaa.service.admin.OrderService_Ad;
import aaa.service.admin.ShopService_Ad;

@Service
public class Delivery_Ad implements OrderService_Ad{

	@Override
	public Object execute(ControllDTO controlDTO) {
		// TODO Auto-generated method stub
		return "배송 현황 데이터 입니다.";
	}

	
}
