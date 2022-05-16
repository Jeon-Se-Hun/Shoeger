package aaa.model;

import lombok.Data;

@Data
public class AdPageDTO {

   Integer page = 1, cnt=0;
   Integer start, limit = 10, pageLimit = 6, total, startPage, endPage;
   
   public AdPageDTO() {}
   
   public void  setCnt(Integer cnt) {
      this.cnt = cnt;
      
      if(cnt==null)
         this.cnt = 0;
      
      init(cnt);
   }
   
   public void init(int cnt) {
     start = (page-1) * limit;
   
     int ttt = cnt;
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