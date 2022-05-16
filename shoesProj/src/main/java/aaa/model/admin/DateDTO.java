package aaa.model.admin;

import java.util.Date;

import lombok.Data;

@Data
public class DateDTO {
	Date stoday, etoday, sweekday,eweekday,smonthday,emonthday,
			syearday, eyearday;

	public DateDTO() {
		this.stoday = init();
		this.etoday = init();
		this.sweekday = init();
		this.eweekday = init();
		this.smonthday = init();
		this.emonthday = init();
		this.syearday = init();
		this.eyearday = init();
		
		etoday.setDate(etoday.getDate()+1);
		
		sweekday.setDate(sweekday.getDate()-sweekday.getDay());
		eweekday.setTime(sweekday.getTime());
		eweekday.setDate(sweekday.getDate()+7);
		
		smonthday.setDate(1);
		emonthday.setDate(1);
		emonthday.setMonth(emonthday.getMonth()+1);
		
		
		syearday.setDate(1);
		syearday.setMonth(0);
		eyearday.setDate(1);
		eyearday.setMonth(0);
		eyearday.setYear(eyearday.getYear()+1);
	}
	
	Date init(){
		Date dd = new Date();
		dd.setHours(0);
		dd.setMinutes(0);
		dd.setSeconds(0);
		return dd;
	}
}
