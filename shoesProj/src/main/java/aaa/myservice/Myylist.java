package aaa.myservice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.AdPageDTO;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.PorderDTO;
import aaa.model.SecessionDTO;
import aaa.model.WishDTO;
import aaa.service.myysalsService;

@Service
public class Myylist implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		AdPageDTO pageDTO = (AdPageDTO)(map.get("pageDTO"));
		pageDTO.setLimit(6);
		pageDTO.init(mm.myqnaCnt((ClientDTO) map.get("cDTO")));
		res.put("pageDTO", pageDTO);
		res.put("myqna", mm.myqna(map));
		res.put("wlist", mm.miniwish((ClientDTO) map.get("cDTO")));
		return res;
	}

}
