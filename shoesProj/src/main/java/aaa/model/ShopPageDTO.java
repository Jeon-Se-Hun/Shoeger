package aaa.model;

import java.util.HashMap;

import aaa.model.db.ViewMapper;
import lombok.Data;

@Data
public class ShopPageDTO {


	Integer page = 1, cnt=0;
	Integer start, limit = 8, pageLimit = 5, total, startPage, endPage;
	
	
	 public void setCnt(Integer cnt) {
	 
	 this.cnt = cnt;
	 
	 if(cnt==null) 
		 this.cnt = 0;
	 
	 }
	
	public void init(ViewMapper vm, HashMap<String, Object> map) {
		start = (page-1) * limit;
		
		int ttt = vm.totalCnt(map);
		this.total = ttt/limit;
		
		if(ttt%limit>0)
			total++;
		
		start = (page-1)*limit;
		
		startPage = (page-1)/pageLimit * pageLimit +1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > total) {
			endPage = total;
		}
	}
	
	public void init2(ViewMapper vm, HashMap<String, Object> map) {
		start = (page-1) * limit;
		
		int ttt = vm.totalCnt2(map);
		this.total = ttt/limit;
		
		if(ttt%limit>0)
			total++;
		
		start = (page-1)*limit;
		
		startPage = (page-1)/pageLimit * pageLimit +1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > total) {
			endPage = total;
		}
	}
	
	public void init3(ViewMapper vm, HashMap<String, Object> map) {
		start = (page-1) * limit;
		
		int ttt = vm.totalCntAllprod(map);
		this.total = ttt/limit;
		
		if(ttt%limit>0)
			total++;
		
		start = (page-1)*limit;
		
		startPage = (page-1)/pageLimit * pageLimit +1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > total) {
			endPage = total;
		}
	}
	
	public void init4(ViewMapper vm, HashMap<String, Object> map) {
		start = (page-1) * limit;
		
		int ttt = vm.stockCnt(map);
		this.total = ttt/limit;
		
		if(ttt%limit>0)
			total++;
		
		start = (page-1)*limit;
		
		startPage = (page-1)/pageLimit * pageLimit +1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > total) {
			endPage = total;
		}
	}
	
	
}
