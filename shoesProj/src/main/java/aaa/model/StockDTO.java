package aaa.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StockDTO {
	Integer psize, bprice, sprice, noid, tradeid, productid;
	String pid, grade, model, brand, img1, kind, img2, img3, kname;
	Date bdate, sdate;
	
	MultipartFile file1, file2, file3;
}
