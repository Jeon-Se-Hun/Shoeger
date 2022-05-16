package aaa.service.admin.order;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.OperationDTO;
import aaa.model.OrderDTO;
import aaa.model.StockDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.OrderService_Ad;

@Service
public class OrderDetail_Ad implements OrderService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		OrderDTO ooDTO = mm.ooDetail(controlDTO.getOoDTO());
		ClientDTO ccDTO = new ClientDTO();
		ccDTO.setPid(ooDTO.getPid());
		
		StockDTO ssDTO = controlDTO.getSsDTO();
		ssDTO.setProductid(ooDTO.getProductid());

		res.put("ooDTO", ooDTO);
		res.put("ccDTO", mm.ccDetail(ccDTO));
		res.put("ssDTO", mm.ssDetail(controlDTO.getSsDTO()));
		
		
		return res;
	}

	
}
