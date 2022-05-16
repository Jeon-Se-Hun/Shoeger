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
import aaa.model.db.BrandDTO;
import aaa.service.admin.ProductService_Ad;
import aaa.service.admin.ShopService_Ad;

@Service
public class BrandInReg_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		
		ProductDTO dto = controlDTO.getPpDTO();
		BrandDTO brandDTO = controlDTO.getBrandDTO();
		HttpServletRequest request = controlDTO.getRequest();
		
		String msg = "이미지 파일을 확인해주세요";
		String url = "product/brandInsert";
		url += "?kname="+brandDTO.getKname();
		url += "&ename="+brandDTO.getEname();
		url += "&brandprint="+brandDTO.getBrandprint();
		url += "&content1="+brandDTO.getContent1();
		url += "&content2="+brandDTO.getContent2();
		url += "&content3="+brandDTO.getContent3();
		url += "&page="+controlDTO.getPageDTO().getPage();
		
		if(mm.brandDetailKname(brandDTO) != null) {
			msg = "이미 등록된 브랜드명(kor) 입니다.";
		}else if(mm.brandDetailEname(brandDTO) != null) {
			msg = "이미 등록된 브랜드명(eng) 입니다.";
		}else {
			if(!dto.getFile().getOriginalFilename().equals("")) {
				
				if(Pattern.matches("image/.*", dto.getFile().getContentType())) {
					brandDTO.setImg(new FileDTO().fileSave(dto.getFile(), request));
					
					
					mm.brandInsert(brandDTO);
					
					
					msg = "등록되었습니다.";
					url = "product/brand";
				}
			}
			
		}
		
		
		
		
		
		res.put("msg", msg);
		res.put("url", url);
		return res;
	}

	
}
