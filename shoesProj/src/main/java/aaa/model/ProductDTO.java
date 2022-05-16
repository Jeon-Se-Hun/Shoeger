package aaa.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDTO {
	Integer rel_price;
	String kname, ename, brand, model, img1;
	Date rel_date;
	MultipartFile file;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	public void setRel_dateStr(String dateStr) {
		if (dateStr != null && !dateStr.equals("")) {
			try {
				System.out.println("1" + dateStr);
				this.rel_date = sdf.parse(dateStr);
			} catch (ParseException e) {
				e.printStackTrace();
			}

		}
	}

	public String getRel_dateStr() {
		return sdf.format(rel_date);
	}
}
