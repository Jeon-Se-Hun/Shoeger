package aaa.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientAction;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;

@Service
public class ChangePwReg implements ClientAction {

	@Resource
	ClientMapper client;
	
	@Override
	public Object execute(ClientDTO cDTO) {
		
		client.changePw(cDTO);
		
		return null;
		
	}

}
