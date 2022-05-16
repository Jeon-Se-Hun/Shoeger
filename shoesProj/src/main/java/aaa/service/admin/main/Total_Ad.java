package aaa.service.admin.main;

import java.util.HashMap;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.DateDTO;
import aaa.service.admin.MainService_Ad;

@Service
public class Total_Ad implements MainService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute() {
		DateDTO dateDTO = new DateDTO();
		HashMap<String, Object> res = new HashMap<>();
		
		System.out.println(dateDTO);
		
		res.put("ssDTO", mm.showState());
		res.put("ssTot", mm.salesTot(dateDTO));
		res.put("ccTot", mm.clientTot(dateDTO));
		res.put("vvTot", mm.visitTot(dateDTO));
		res.put("bbList", mm.mainBoardlist());
		
		System.out.println(res);
		
		int ii = 1234567;
		System.out.println();
		
		
		return res;
	}

}
