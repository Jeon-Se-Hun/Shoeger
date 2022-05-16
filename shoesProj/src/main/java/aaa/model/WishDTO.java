package aaa.model;

import java.util.Date;

import lombok.Data;

@Data
public class WishDTO {
	String pid, model, img1, kname, grade;
	Integer num, psize;
	Date sdate;
}
