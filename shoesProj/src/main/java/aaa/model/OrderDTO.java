package aaa.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	String kind, pid,model, state, statebb, content;
	Integer price, tradeid, productid, pointuse, psize;
	Date pdate;
	Integer[] tradeidArr;
}
