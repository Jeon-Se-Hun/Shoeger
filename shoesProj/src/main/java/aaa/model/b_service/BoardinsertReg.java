package aaa.model.b_service;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import aaa.model.BoardDTO;
import aaa.model.ClientMapper;
import aaa.model.db.AlertDTO;
import aaa.model.db.BoardAction;

@Service
public class BoardinsertReg implements BoardAction {

	@Resource
	ClientMapper cc;

	@Override
	public Object execute(HashMap<String, Object> map) {

		HashMap<String, Object> res = new HashMap();

		((BoardDTO) map.get("bDTO")).setUpfile(((BoardDTO) map.get("bDTO")).getFf().getOriginalFilename());

		AlertDTO dto = new AlertDTO();
		BoardDTO bDTO = (BoardDTO) map.get("bDTO");

		dto.setMsg("파일 이미지를 확인해 주세요.");
		dto.setUrl("insertForm?title=" + bDTO.getTitle() + "&contents=" + bDTO.getContent());

		if (!bDTO.getFf().getOriginalFilename().equals("")) {

			if (Pattern.matches("image/.*", bDTO.getFf().getContentType())) {
				cc.bbInsert(bDTO);

				bDTO.setUpfile(fileSave(bDTO.getFf(), ((HttpServletRequest) map.get("request"))));
				dto.setMsg("작성되었습니다.");
				dto.setUrl("detail?id=" + ((BoardDTO) map.get("bDTO")).getId());

			}

		} else {
			cc.bbInsert(bDTO);

			dto.setMsg("작성되었습니다.");
			dto.setUrl("detail?id=" + ((BoardDTO) map.get("bDTO")).getId());
		}

		return dto;
	}

	String fileSave(MultipartFile mf, HttpServletRequest request) {
		String path = request.getRealPath("resources/fff/");
		path = "D:\\study\\springWork\\godsehun\\shoesProj\\src\\main\\webapp\\resources\\fff";

		int pos = mf.getOriginalFilename().lastIndexOf(".");

		String fname = mf.getOriginalFilename();

		String domain = fname.substring(0, pos);
		String ext = fname.substring(pos);

		int no = 0;

		try {
			File ff = new File(path+ "\\"+ fname);
			while (ff.exists()) {
				no++;
				fname = domain + no + ext;
				ff = new File(path+ "\\"+ fname);
			}

			FileOutputStream fos = new FileOutputStream(ff);

			fos.write(mf.getBytes());

			fos.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return fname;
	}

}