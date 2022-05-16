package aaa.service.admin.board;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.BoardDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.service.admin.BoardService_Ad;

@Service
public class DeleteReg_Ad implements BoardService_Ad {

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		BoardDTO bDTO = controlDTO.getBbDTO();
		
		FileDTO.fileDelete(controlDTO.getRequest(), bDTO.getUpfile());
		mm.bbDelete(bDTO);
		
		String url = "board/" + bDTO.getKind();
		
		res.put("msg", "삭제 되었습니다.");
		res.put("url", url);
		return res;
	}

}
