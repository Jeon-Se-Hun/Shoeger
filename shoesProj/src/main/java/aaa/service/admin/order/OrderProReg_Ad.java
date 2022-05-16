package aaa.service.admin.order;


import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import aaa.model.OrderDTO;
import aaa.model.ProductDTO;
import aaa.model.StockDTO;
import aaa.model.TradeDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.service.admin.OrderService_Ad;

@Service
public class OrderProReg_Ad implements OrderService_Ad{

   @Resource
   AdminMapper mm;
   
   @Override
   public Object execute(ControllDTO controlDTO) {
      HashMap<String, Double> rankPrice = new HashMap<>();
      rankPrice.put("S", 0.8);
      rankPrice.put("A", 0.7);
      rankPrice.put("B", 0.6);
      
      
      FileDTO ffDTO = new FileDTO();
      OrderDTO ooDTO = controlDTO.getOoDTO();
      StockDTO ssDTO = controlDTO.getSsDTO();
      ProductDTO ppDTO = mm.ppDetail(controlDTO.getPpDTO());
      
      
      String msg = "검수완료.";
      
      OrderDTO chk = mm.ooDetail(ooDTO);
      
      if(chk.getState().equals("취소") || chk.getState().equals("완료")) {
         msg = "이미 검수완료된 상품입니다.";
      }else {
         if(Pattern.matches("image/.*", ssDTO.getFile1().getContentType()) && 
               Pattern.matches("image/.*", ssDTO.getFile2().getContentType()) && 
               Pattern.matches("image/.*", ssDTO.getFile3().getContentType())) {
            
            
            ssDTO.setImg1(ffDTO.fileSave(ssDTO.getFile1(), controlDTO.getRequest()));
            ssDTO.setImg2(ffDTO.fileSave(ssDTO.getFile2(), controlDTO.getRequest()));
            ssDTO.setImg3(ffDTO.fileSave(ssDTO.getFile3(), controlDTO.getRequest()));
            
            
            
            
            
            
            ssDTO.setBprice((int)Math.round( ppDTO.getRel_price()*rankPrice.get(ssDTO.getGrade())/1000 )*1000);   
            
            ooDTO.setPrice(ssDTO.getBprice());
            mm.ooModifyPP(ooDTO);
            
            ssDTO.setSprice((int)(Math.round(ssDTO.getBprice()*1.1)/1000 )*1000);
            ssDTO.setBrand(ppDTO.getBrand());
            
            
            
            
            ooDTO = mm.ooDetail(ooDTO);
            ooDTO.setState("완료");
            ooDTO.setContent("완료");
            
            
            mm.ssInsert(ssDTO);
            ooDTO.setProductid(ssDTO.getProductid());
            mm.ooModify(ooDTO);
            
            
//         // 트레이드
            TradeDTO ttDTO = controlDTO.getTtDTO();
            ttDTO.setKind(ooDTO.getKind());
            ttDTO.setPrice(ssDTO.getBprice());
            System.out.println(ppDTO);
            System.out.println(ttDTO);
            mm.ttInsert(ttDTO);
            
            
         }else {
            msg = "이미지를 확인해주세요";
         }
         
      }
      


      
      
      
      
      
      HashMap<String, Object> res = new HashMap<>();
      
      
      String url = "order/orderDetail?";
      url += "page="+controlDTO.getPageDTO().getPage();
      url += "&tradeid="+controlDTO.getOoDTO().getTradeid();
      url += "&sdateStr="+controlDTO.getSchDTO().getSdateStr();
      url += "&edateStr="+controlDTO.getSchDTO().getEdateStr();
      url += "&skind="+controlDTO.getSchDTO().getSkind();
      url += "&kind="+controlDTO.getSchDTO().getKind();
      url += "&sch="+controlDTO.getSchDTO().getSch();
      url += "&service="+controlDTO.getSchDTO().getService();
      
      
      
      
      res.put("msg", msg);
      res.put("url", url);
      return res;
   }
   
   
}
