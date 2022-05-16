package aaa.service.admin.board;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.BoardService_Ad;

@Service
public class InsertForm_Ad implements BoardService_Ad {
	
	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		return null;
	}

}
