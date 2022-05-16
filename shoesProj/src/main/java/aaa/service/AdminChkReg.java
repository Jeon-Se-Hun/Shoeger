package aaa.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientAction;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;

@Service
public class AdminChkReg implements ClientAction {

	@Resource
	ClientMapper client;
	
	@Override
	public Object execute(ClientDTO cDTO) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		int cnt = client.addAdmin(cDTO);
		
		map.put("cnt", cnt);
		
		return map;
		
	}

}
