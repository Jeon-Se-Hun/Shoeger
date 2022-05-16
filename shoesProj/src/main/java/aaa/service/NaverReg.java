package aaa.service;
import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.NaverLoginAction;

@Service
public class NaverReg implements NaverLoginAction {

	@Resource
	ClientMapper client;

	@Override
	public Object execute(JSONObject response_obj) {
		String pid = ((String)response_obj.get("email"));
		String birthday = (String) response_obj.get("birthday");
		String birthYear = (String) response_obj.get("birthyear");
		
		ClientDTO dto = new ClientDTO();
		dto.setKind("네이버");
		dto.setPid(pid);
		dto.setPw(pid);
		dto.setPname((String)response_obj.get("name"));
		dto.setEmail(pid);
		dto.setPhone((String)response_obj.get("mobile"));
		dto.setBirth(birthday, birthYear);
		ClientDTO chk = new ClientDTO();
		
		chk = client.clientChk(dto);
		
		if(client.idChk(dto) != null) {
			return "탈퇴";
		}
		
		if(chk == null) {
			client.join(dto);
		}
		
		return pid;
	}

}
