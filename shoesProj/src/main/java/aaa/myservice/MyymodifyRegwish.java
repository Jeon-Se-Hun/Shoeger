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
public class MyymodifyRegwish implements myysalsService {

	@Resource
	ClientMapper mm;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap<String, Object>();
	    res.put("wishdel", mm.wishdel((WishDTO) map.get("wish")));
	    res.put("msg", "관심상품 삭제완료");
	
		return res;
	}

}
