package aaa.model.db;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MainDTO {

	String kname, ename, brand, model, img1, topimg, sideimg, backimg, imgName, filter, sch;
	Date rel_date;
	Integer rel_price, num, totalPrice;
	MultipartFile ff;
	
	String search;
}
