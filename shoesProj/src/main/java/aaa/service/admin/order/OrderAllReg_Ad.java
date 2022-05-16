package aaa.service.admin.order;


import java.util.Date;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.OrderDTO;
import aaa.model.ProductDTO;
import aaa.model.StockDTO;
import aaa.model.TradeDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.OrderService_Ad;

@Service
public class OrderAllReg_Ad implements OrderService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		HashMap<String, Object> res = new HashMap<>();
		
		
		
		OrderDTO dto = controlDTO.getOoDTO();
		
		
		for (Integer ii : controlDTO.getOoDTO().getTradeidArr()) {
			dto.setTradeid(ii);
			
			OrderDTO chk =  mm.ooDetail(dto);
			if(!chk.getState().equals("완료") && !chk.getState().equals("취소")&& !chk.getState().equals("검수중") && !chk.getState().equals("취소완료")) {
				System.out.println(chk);
				
				mm.ooInsert(dto);
				
				if((chk.getKind().equals("취소")||chk.getKind().equals("환불") )&& dto.getState().equals("완료")) {
					dto = mm.ooDetail(dto);
					StockDTO sDTO = new StockDTO();
					TradeDTO tDTO = new TradeDTO();
					sDTO.setProductid(dto.getProductid());
					tDTO.setTradeid(dto.getTradeid());
					
					TradeDTO tradeDetail = mm.ttDetail(tDTO);
					mm.ssModify(sDTO);
					
					ClientDTO ccDTO = new ClientDTO();
					ccDTO.setPid(tradeDetail.getPid());
					ccDTO.setPoint((int)(tradeDetail.getPrice()*0.005));
					mm.ccModifyPoint(ccDTO);
					
					mm.ttModify(tDTO);
				}

			}
			
		}
		
		
		
		
		
		String url = "order/"+controlDTO.getSchDTO().getService()+"?";
		url += "page="+controlDTO.getPageDTO().getPage();
		url += "&tradeid=";
		url += "&sdateStr="+controlDTO.getSchDTO().getSdateStr();
		Date dd = controlDTO.getSchDTO().getEdate();
		dd.setDate(dd.getDate()-1);
		controlDTO.getSchDTO().setEdate(dd);
		url += "&edateStr="+controlDTO.getSchDTO().getEdateStr();
		url += "&state="+controlDTO.getOoDTO().getStatebb();
		url += "&skind="+controlDTO.getSchDTO().getSkind();
		url += "&kind="+controlDTO.getSchDTO().getKind();
		url += "&sch="+controlDTO.getSchDTO().getSch();
		url += "&service="+controlDTO.getSchDTO().getService();
	
		System.out.println(url);
		res.put("msg", "적용되었습니다.");
		res.put("url", url);
		return res;
	}

	
}
