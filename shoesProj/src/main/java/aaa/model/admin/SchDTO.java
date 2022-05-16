package aaa.model.admin;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class SchDTO {
	String brand="전체", skind="",kind="", sch="", state="", service="";
	
	Date sdate=null, edate=null;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM");
	SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
	
	public void setSdateStr(String sdate) {
		if(sdate != null && !sdate.equals("")) {
			try {
				this.sdate = sdf.parse(sdate);
			} catch (ParseException e) {
				try {
					this.sdate = sdf1.parse(sdate);
				} catch (ParseException e1) {
					try {
						this.sdate = sdf2.parse(sdate);
					} catch (ParseException e2) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
		}
	}
	
	public void setEdateStr(String edate) {
		if(edate != null && !edate.equals("")) {
			try {
				this.edate = sdf.parse(edate);
				this.edate.setDate(this.edate.getDate()+1);
			} catch (ParseException e) {
				try {
					this.edate = sdf1.parse(edate);
					this.edate.setMonth(this.edate.getMonth()+1);
				} catch (ParseException e1) {
					try {
						this.edate = sdf2.parse(edate);
						this.edate.setYear(this.edate.getYear()+1);
					} catch (ParseException e2) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
		}
		
	}
	public String getSdateStr() {
		return sdf.format(sdate);
	}
	
	public String getEdateStr() {
		return sdf.format(edate);
	}
	
}
