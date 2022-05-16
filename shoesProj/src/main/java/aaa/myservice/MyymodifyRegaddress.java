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
public class MyymodifyRegaddress implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
		ClientDTO dto = (ClientDTO) (map.get("cDTO"));
		if (!dto.getAddress2().equals("") && !dto.getAddress3().equals("") && !dto.getMaddress().equals("")) {
			res.put("address", mm.address((ClientDTO) map.get("cDTO")));
			res.put("msg", "수정완료");
		}else {
			res.put("msg", "모든 항목을 작성하세요.");
		}
		return res;
	}

}
