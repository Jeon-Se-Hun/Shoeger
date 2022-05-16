package aaa.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientAction;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;

@Service
public class JoinReg implements ClientAction {

	@Resource
	ClientMapper client;

	@Override
	public Object execute(ClientDTO cDTO) {

		cDTO.setBirth(cDTO.getBirthDay(), cDTO.getBirthYear());

		client.join(cDTO);
		return null;

	}
}
