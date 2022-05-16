package aaa.service.admin.product;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.model.admin.SchDTO;
import aaa.service.admin.ProductService_Ad;
import aaa.service.admin.ShopService_Ad;

@Service
public class NewReg_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		
		ProductDTO dto = controlDTO.getPpDTO();
		HttpServletRequest request = controlDTO.getRequest();
		
		System.out.println(dto);
		
		String msg = "이미지 파일을 확인해주세요";
		String url = "product/new";
		url += "?rel_price="+dto.getRel_price();
		url += "&kname="+dto.getKname();
		url += "&ename="+dto.getEname();
		url += "&brand="+dto.getBrand();
		url += "&model="+dto.getModel();
		url += "&rel_dateStr="+dto.getRel_dateStr();
		
		
		
		
		if(mm.ppDetail(dto) != null) {
			msg = "이미 등록된 모델번호 입니다.";
		}else if(mm.ppDetailKname(dto) != null) {
			msg = "이미 등록된 모델명(kor) 입니다.";
		}else if(mm.ppDetailEname(dto) != null) {
			msg = "이미 등록된 모델명(eng) 입니다.";
		}else {
			
			if(!dto.getFile().getOriginalFilename().equals("")) {
				
				if(Pattern.matches("image/.*", dto.getFile().getContentType())) {
					dto.setImg1(new FileDTO().fileSave(dto.getFile(), request));
					mm.proinsert(dto);
					msg = "등록되었습니다.";
					url = "product/productList";
				}
			}
		}
		
		
		
		
		res.put("msg", msg);
		res.put("url", url);
		return res;
	}

	
}
