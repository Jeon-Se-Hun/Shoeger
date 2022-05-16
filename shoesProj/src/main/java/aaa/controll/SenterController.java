package aaa.controll;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import aaa.model.BoardDTO;
import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.PPPData;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.BoardAction;
import aaa.model.db.MainDTO;
import aaa.model.db.PageDTO;
import aaa.service.ContentService;
import aaa.service.MyProvider;

@Controller
@RequestMapping("/shoeger/{cate}/{service}/{cate2}/{service2}")
public class SenterController {

   @Resource
   MyProvider myProvider;

   @Resource
   ClientMapper client;

   @ModelAttribute("PPPData")
   PPPData pppData(@PathVariable String cate, @PathVariable String service) {
      PPPData ppp = new PPPData(cate, service);
      return ppp;
   }

   @ModelAttribute("PPPData2")
   PPPData pppData2(@PathVariable String cate2, @PathVariable String service2) {
      PPPData ppp = new PPPData(cate2, service2);
      System.out.println("pppData2 실행");
      System.out.println(ppp);
      return ppp;
   }

   @ModelAttribute("data")
   Object ddd(@PathVariable String cate2 ,@PathVariable String service2, PageDTO pDTO, BoardDTO bDTO, HttpServletRequest request, String service) {

      BoardAction res = myProvider.getContext().getBean("board" + service2, BoardAction.class);

      HashMap<String, Object> map = new HashMap<>();
         map.put("pDTO", pDTO);
         map.put("bDTO", bDTO);
         map.put("cate", cate2);
         map.put("request", request);
         map.put("service", service);
         System.out.println(service);
      return res.execute(map);
   }
   
   @ModelAttribute("schData")
   Object schData(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
      ContentService cs = myProvider.getContext().getBean("mainview", ContentService.class);
      return cs.execute(mDTO, sDTO, cDTO, session, wDTO, poDTO, spDTO);
   }

   @RequestMapping
   String view(@PathVariable String service2) {

      if (service2.endsWith("Reg")) {
         return "shoeger/board/alert";
      }

      return "shoeger/template";
   }
}