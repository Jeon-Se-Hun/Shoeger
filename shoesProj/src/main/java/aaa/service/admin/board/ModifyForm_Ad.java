package aaa.service.admin.board;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.BoardDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.BoardService_Ad;

@Service
public class ModifyForm_Ad implements BoardService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		BoardDTO bDTO = new BoardDTO();
		
		bDTO.setId(controlDTO.getBbDTO().getId());
		
		res.put("rbgusdetail", mm.rbgusdetail(bDTO));
		return res;
	}

}
