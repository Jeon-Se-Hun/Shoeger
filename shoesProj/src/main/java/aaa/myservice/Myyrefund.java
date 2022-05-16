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
public class Myyrefund implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		AdPageDTO pageDTO = (AdPageDTO)(map.get("pageDTO"));
		System.out.println(((ClientDTO)map.get("cDTO")).getSerch());
		if(((ClientDTO)map.get("cDTO")).getSerch()==null ||((ClientDTO)map.get("cDTO")).getSerch().equals("전체")) {
			pageDTO.init(mm.refundCnt((ClientDTO) map.get("cDTO")));
			res.put("refund", mm.refund(map));
		}else {
			pageDTO.init(mm.refundcateCnt((ClientDTO) map.get("cDTO")));
			res.put("refund", mm.refundcate(map));
			System.out.println("tqtqtqtqtqtqt");
		}
		
		res.put("pageDTO", pageDTO);
	    res.put("wlist", mm.miniwish((ClientDTO) map.get("cDTO")));
		return res;
	}

}
