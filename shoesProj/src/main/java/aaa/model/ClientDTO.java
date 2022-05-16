package aaa.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Data;

@Data
public class ClientDTO {
	String kind, pid, pw, pname, email, address1, address2, address3, phone, card,cardnum, account, birthDay, birthYear,accountname,accountnum,maddress;
	Integer  psize, point;
	Date birth, reg_date;
	String serch;
	

	public void setBirth(String birthDay, String birthYear) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			String dd = birthYear + "-" + birthDay;
			
			this.birth = sdf.parse(dd);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	
	
}
