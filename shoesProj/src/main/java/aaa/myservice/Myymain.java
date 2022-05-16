package aaa.myservice;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.service.myysalsService;

@Service
public class Myymain implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("cli", mm.client((ClientDTO) map.get("cDTO")));
		res.put("mymain", mm.mymain((ClientDTO) map.get("cDTO")));
		res.put("wlist", mm.miniwish((ClientDTO) map.get("cDTO")));
		return res;
	}

}
