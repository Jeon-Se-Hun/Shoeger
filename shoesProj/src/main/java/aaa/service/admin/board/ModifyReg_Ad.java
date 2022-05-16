package aaa.service.admin.board;

import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.BoardDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.service.admin.BoardService_Ad;

@Service
public class ModifyReg_Ad implements BoardService_Ad {

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		BoardDTO bDTO = controlDTO.getBbDTO();
		
		res.put("msg", "이미지를 확인해주세요.");	
		
		String url = "board/modifyForm?id="+bDTO.getId();
		url += "&page="+controlDTO.getPageDTO().getPage();
		url += "&skind="+controlDTO.getSchDTO().getSkind();
		url += "&sch="+controlDTO.getSchDTO().getSch();
		
		System.out.println(bDTO.getFf().getOriginalFilename());
		
		if (!bDTO.getFf().getOriginalFilename().equals("")) {

			if (Pattern.matches("image/.*", bDTO.getFf().getContentType())) {
				FileDTO.fileDelete(controlDTO.getRequest(), bDTO.getUpfile());
				bDTO.setUpfile(FileDTO.fileSave(bDTO.getFf(), controlDTO.getRequest()));
				
				res.put("msg", "수정 되었습니다.");	
				
				mm.bbModify(bDTO);
				url = "board/answer?id="+bDTO.getId();
				url += "&page="+controlDTO.getPageDTO().getPage();
				url += "&skind="+controlDTO.getSchDTO().getSkind();
				url += "&sch="+controlDTO.getSchDTO().getSch();
			}
		}else {
			res.put("msg", "수정 되었습니다.");	
			
			mm.bbModify(bDTO);
			url = "board/answer?id="+bDTO.getId();
			url += "&page="+controlDTO.getPageDTO().getPage();
			url += "&skind="+controlDTO.getSchDTO().getSkind();
			url += "&sch="+controlDTO.getSchDTO().getSch();
			
		}
		
		res.put("url", url );
		return res;
	}

}
