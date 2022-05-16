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
import aaa.model.db.PageDTO;

@Service
public class BoardmodifyReg implements BoardAction {

	@Resource
	ClientMapper cc;

	@Override
	public Object execute(HashMap<String, Object> map) {

		BoardDTO bDTO = ((BoardDTO) map.get("bDTO"));
		AlertDTO dto = new AlertDTO();

		dto.setMsg("이미지를 확인해주세요.");
		dto.setUrl("modifyForm?id=" + ((BoardDTO) map.get("bDTO")).getId() + "&page="
				+ ((PageDTO) map.get("pDTO")).getPage() + "&sch=" + ((BoardDTO) map.get("bDTO")).getSch() + "&kind="
				+ ((BoardDTO) map.get("bDTO")).getKind() + "&service=" + ((String) map.get("service")) + "&pid="
				+ bDTO.getPid());
		
		
		if (!bDTO.getFf().getOriginalFilename().equals("")) {

			if (Pattern.matches("image/.*", bDTO.getFf().getContentType())) {
				fileDelete(((HttpServletRequest) map.get("request")), bDTO.getUpfile());
				bDTO.setUpfile(fileSave(bDTO.getFf(), ((HttpServletRequest) map.get("request"))));

				cc.bbModify(bDTO);
				dto.setMsg("수정되었습니다.");
				dto.setUrl("detail?id=" + ((BoardDTO) map.get("bDTO")).getId() + "&page="
						+ ((PageDTO) map.get("pDTO")).getPage() + "&sch=" + ((BoardDTO) map.get("bDTO")).getSch()
						+ "&kind=" + ((BoardDTO) map.get("bDTO")).getKind() + "&service="
						+ ((String) map.get("service")));
			}
		}else {
			dto.setMsg("수정되었습니다.");
			dto.setUrl("detail?id=" + ((BoardDTO) map.get("bDTO")).getId() + "&page="
					+ ((PageDTO) map.get("pDTO")).getPage() + "&sch=" + ((BoardDTO) map.get("bDTO")).getSch()
					+ "&kind=" + ((BoardDTO) map.get("bDTO")).getKind() + "&service="
					+ ((String) map.get("service")));
			
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
			File ff = new File(path + "\\" + fname);
			while (ff.exists()) {
				no++;
				fname = domain + no + ext;
				ff = new File(path + "\\"+ fname);
			}

			FileOutputStream fos = new FileOutputStream(ff);

			fos.write(mf.getBytes());

			fos.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return fname;
	}
	
	public final static void fileDelete(HttpServletRequest request, String fname) {
		String path = request.getRealPath("resources/fff/");
		path = "D:\\\\study\\\\springWork\\\\godsehun\\\\shoesProj\\\\src\\\\main\\\\webapp\\\\resources\\\\fff";
		if(fname != null) { // 파일명이 존재한다면
			
			// 실제 경로를 가져와 파일을 삭제해라
			new File(path + "\\" + fname).delete();
		}
	}
}
