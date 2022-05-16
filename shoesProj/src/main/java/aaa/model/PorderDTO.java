package aaa.model;

import java.util.Date;

import lombok.Data;

@Data
public class PorderDTO {
	String kind, pid, model, state, img1, kname;
	Integer price, tradeid, pointuse, productid, bprice, psize, newFinalPoint;
	Date pdate;

}