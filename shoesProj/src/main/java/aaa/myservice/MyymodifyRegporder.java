package aaa.myservice;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientMapper;
import aaa.model.PorderDTO;
import aaa.service.myysalsService;

@Service
public class MyymodifyRegporder implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {
		PorderDTO pDTO = (PorderDTO) map.get("porder");
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("porder", mm.pordermodify((PorderDTO) map.get("porder")));
		
		res.put("msg", pDTO.getState()+" 완료");
	
		return res;
	}

}
