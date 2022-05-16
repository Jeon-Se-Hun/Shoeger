package aaa.service.admin.board;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.BoardDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.CsData;
import aaa.model.admin.SchDTO;
import aaa.service.admin.BoardService_Ad;

@Service
public class Fnq_Ad implements BoardService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		controlDTO.getPageDTO().init(0);
		controlDTO.getBbDTO().setKind("fnq");
		List<BoardDTO> bblist = mm.bblist(controlDTO);
		controlDTO.getPageDTO().init(mm.bblistCnt(controlDTO));
		
		
		res.put("bblist", bblist);
		res.put("brand", mm.brandList());
		res.put("pageDTO", controlDTO.getPageDTO());
		
		return res;
	}

	
}
