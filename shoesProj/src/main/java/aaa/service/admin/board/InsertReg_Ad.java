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
public class InsertReg_Ad implements BoardService_Ad {

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		HashMap<String, Object> res = new HashMap<>();
		BoardDTO bDTO =  controlDTO.getBbDTO();
		
		bDTO.setUpfile(bDTO.getFf().getOriginalFilename());
		
		res.put("msg", "파일 이미지를 확인해 주세요.");
		res.put("url", "board/insertForm?title="+bDTO.getTitle() +"&contents="+bDTO.getContent());

		if (!bDTO.getFf().getOriginalFilename().equals("")) {

			if (Pattern.matches("image/.*", bDTO.getFf().getContentType())) {
				mm.bbInsert(bDTO);

				bDTO.setUpfile(FileDTO.fileSave(bDTO.getFf(), controlDTO.getRequest()));
				res.put("msg", "추가되었습니다.");
				res.put("url", "board/answer?id=" + bDTO.getId() + "&page=1");
			}

		} else {
			mm.bbInsert(bDTO);
			res.put("msg", "추가되었습니다.");
			res.put("url", "board/answer?id=" + bDTO.getId()  + "&page=1");
		}
		
		return res;
	}

}
