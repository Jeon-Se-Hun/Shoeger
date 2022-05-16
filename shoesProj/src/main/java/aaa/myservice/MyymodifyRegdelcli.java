package aaa.myservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.PorderDTO;
import aaa.model.SecessionDTO;
import aaa.model.WishDTO;
import aaa.service.myysalsService;

@Service
public class MyymodifyRegdelcli implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		SecessionDTO sDTO = mm.secession((ClientDTO) map.get("cDTO"));
		res.put("delcli", mm.delsece((ClientDTO) map.get("cDTO")));
		res.put("addsece", mm.addsece(sDTO));
		res.put("msg", "회원탈퇴 완료");
		return res;
	}

}
