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
public class Myywish implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		
		AdPageDTO pageDTO = (AdPageDTO)(map.get("pageDTO"));
		pageDTO.init(mm.wishCnt((ClientDTO) map.get("cDTO")));
		res.put("pageDTO", pageDTO);
		System.out.println(mm.wish(map));
		res.put("wi", mm.wish(map));
		res.put("wlist", mm.miniwish((ClientDTO) map.get("cDTO")));
		return res;
	}

}
