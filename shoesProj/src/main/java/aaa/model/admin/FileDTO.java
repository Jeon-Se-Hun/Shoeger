package aaa.model.admin;

import java.io.File;

import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileDTO {
	// 파일 경로
	public final static String path(HttpServletRequest request) {
		String url = request.getRequestURI().substring(request.getContextPath().length()).split("/")[3];
		String url1 = request.getRequestURI().substring(request.getContextPath().length()).split("/")[4];
		String path = request.getRealPath("resources/used/");
		path = "D:\\study\\springWork\\godsehun\\shoesProj\\src\\main\\webapp\\resources\\up\\used";
		
		if(url.equals("product") && !url1.startsWith("brand")) {
			path = request.getRealPath("resources/Thumbnail/");
			path = "D:\\study\\springWork\\godsehun\\shoesProj\\src\\main\\webapp\\resources\\up\\Thumbnail";
		}else if(url.equals("product") && url1.startsWith("brand")){
			path = request.getRealPath("resources/brandlogo/");
			path = "D:\\study\\springWork\\godsehun\\shoesProj\\src\\main\\webapp\\resources\\up\\brandlogo";
		}else if(url.equals("board") || url.equals("shop")) {
			path = request.getRealPath("resources/fff/");
			path = "D:\\study\\springWork\\godsehun\\shoesProj\\src\\main\\webapp\\resources\\fff";
		}
		return path;
	}
	
	// 파일 삭제
	public final static void fileDelete(HttpServletRequest request, String fname) {
		
		if(fname != null) { // 파일명이 존재한다면
			
			// 실제 경로를 가져와 파일을 삭제해라
			new File(path(request) + "\\"+ fname).delete();
		}
	}
	
	public final static String fileSave(MultipartFile mf, HttpServletRequest request) {

		int pos = mf.getOriginalFilename().lastIndexOf(".");

		String fname = mf.getOriginalFilename();

		String domain = fname.substring(0, pos);
		String ext = fname.substring(pos);

		int no = 0;

		try {
			File ff = new File(path(request) + "\\"+ fname);
			while (ff.exists()) {
				no++;
				fname = domain + no + ext;
				ff = new File(path(request) + "\\"+ fname);
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
