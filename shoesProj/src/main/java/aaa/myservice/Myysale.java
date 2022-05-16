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
public class Myysale implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		
		AdPageDTO pageDTO = (AdPageDTO)(map.get("pageDTO"));
		if(((ClientDTO)map.get("cDTO")).getSerch()==null ||((ClientDTO)map.get("cDTO")).getSerch().equals("전체")) {
			pageDTO.init(mm.saleCnt((ClientDTO) map.get("cDTO")));
			res.put("slist", mm.sale(map));
		}else {
			pageDTO.init(mm.salecateCnt((ClientDTO) map.get("cDTO")));
			res.put("slist", mm.salecate(map));
		}
		
		res.put("pageDTO", pageDTO);
	    res.put("wlist", mm.miniwish((ClientDTO) map.get("cDTO")));
		return res;
	}

}
