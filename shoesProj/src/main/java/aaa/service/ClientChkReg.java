package aaa.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientAction;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;

@Service
public class ClientChkReg implements ClientAction {

	@Resource
	ClientMapper client;

	@Override
	public Object execute(ClientDTO cDTO) {
		Map<Object, Object> map = new HashMap<Object, Object>();

		ClientDTO dto = new ClientDTO();

		dto = client.clientChk(cDTO);

		if (dto == null && cDTO.getPhone() == null && cDTO.getPw() == null) {
			dto = client.idChk(cDTO);
		}

		map.put("dto", dto);

		return map;

	}

}
