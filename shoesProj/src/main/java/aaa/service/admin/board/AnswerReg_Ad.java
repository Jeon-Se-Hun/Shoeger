package aaa.service.admin.board;


import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.BoardService_Ad;

@Service
public class AnswerReg_Ad implements BoardService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		HashMap<String, Object> res = new HashMap<>();

		res.put("answer", mm.answermodify(controlDTO.getBbDTO()));
		
		res.put("msg", "변경되었습니다.");
		
		//page=${param.page}&skind=${param.skind}&sch=${param.sch}
		
		String url = "board/answer?id="+controlDTO.getBbDTO().getId();
		url += "&page="+controlDTO.getPageDTO().getPage();
		url += "&skind="+controlDTO.getSchDTO().getSkind();
		url += "&sch="+controlDTO.getSchDTO().getSch();
		
		System.out.println(url);
		res.put("url", url );
		return res;
	}
}
