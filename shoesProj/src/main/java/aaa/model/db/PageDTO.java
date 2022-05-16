package aaa.model.db;

import java.util.HashMap;

import aaa.model.ClientMapper;
import lombok.Data;

@Data
public class PageDTO {

	Integer page = 1, cnt=0;
	Integer start, limit = 10, pageLimit = 4, total, startPage, endPage;
	
	public void  setCnt(Integer cnt) {
		this.cnt = cnt;
		
		if(cnt==null)
			this.cnt = 0;
	}
	
	public void init(ClientMapper cc, HashMap<String, Object> map) {
	  start = (page-1) * limit;
	
	  int ttt = cc.totalCnt(map);
      this.total = ttt/limit;
      if(ttt%limit >0)
         total++;
   
      start = (page-1)*limit;
      
      startPage = (page-1)/pageLimit * pageLimit + 1;
      endPage = startPage + pageLimit - 1;
      
      if(endPage>total) {
         endPage=total;
      }
      System.out.println(total +", " + startPage + ", " + endPage);
	}
	
}
