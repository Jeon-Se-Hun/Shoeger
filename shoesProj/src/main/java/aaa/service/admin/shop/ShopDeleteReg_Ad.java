package aaa.service.admin.shop;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class ShopDeleteReg_Ad implements ShopService_Ad {

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		ClientDTO cDTO = controlDTO.getCcDTO();
		System.out.println(cDTO);
		String url = "shop/shopMember";

		mm.ccDelete(cDTO);
		
		HashMap<String, Object> res = new HashMap<>();
		
		res.put("msg", "삭제 되었습니다.");
		res.put("url", url);
		return res;
	}

}
