package aaa.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {

	Integer id, cnt = 0;
	String title, pid, pname, pw, content, upfile, kind, sch, page, answer;
	Date reg_date;
	MultipartFile ff;

	public String getContentBr() {
		return content.replaceAll("\n", "<br>");
	}
}