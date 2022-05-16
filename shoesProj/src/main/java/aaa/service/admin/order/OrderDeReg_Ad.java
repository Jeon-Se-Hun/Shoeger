package aaa.service.admin.order;


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
public class OrderDeReg_Ad implements OrderService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		
		HashMap<String, Object> res = new HashMap<>();
		
		
		OrderDTO dto = controlDTO.getOoDTO();
		
		OrderDTO chk = mm.ooDetail(dto);
		
		String msg = "적용되었습니다.";
		if(chk.getState().equals("취소") || chk.getState().equals("완료") || (chk.getState().equals("검수중") && !dto.getState().equals("취소"))) {
			msg = "적용할수 없습니다.";
		}else {
			
			
			mm.ooInsert(dto);
			
		
			if(dto.getState().equals("취소") && dto.getKind().equals("매입")) {
				msg = "검수취소 되었습니다.";
			}
			
			if((chk.getKind().equals("취소") ||  chk.getKind().equals("환불"))&&dto.getState().equals("완료")) {
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
		

		String url = "order/orderDetail?";
		url += "page="+controlDTO.getPageDTO().getPage();
		url += "&tradeid="+dto.getTradeid();
		url += "&sdateStr="+controlDTO.getSchDTO().getSdateStr();
		url += "&edateStr="+controlDTO.getSchDTO().getEdateStr();
		url += "&skind="+controlDTO.getSchDTO().getSkind();
		url += "&sch="+controlDTO.getSchDTO().getSch();
		url += "&service="+controlDTO.getSchDTO().getService();
		
		
		res.put("msg", msg);
		res.put("url", url);
		
//		orderDeReg?skind=pid&sch=&service=check&state=완료
		return res;
	}

	
}
