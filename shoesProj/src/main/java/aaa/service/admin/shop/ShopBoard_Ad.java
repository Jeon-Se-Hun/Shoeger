package aaa.service.admin.shop;

import org.springframework.stereotype.Service;

import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class ShopBoard_Ad implements ShopService_Ad{

	@Override
	public Object execute(ControllDTO controlDTO) {
		return "게시판 데이터 입니다.";
	}

	
}
