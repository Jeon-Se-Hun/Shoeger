package aaa.service.admin.product;

import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.service.admin.ProductService_Ad;

@Service
public class ProductMoReg_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		ProductDTO pdto = controlDTO.getPpDTO();
		
		String url = "product/productForm?";
		url += "page="+controlDTO.getPageDTO().getPage();
		url += "&model="+pdto.getModel();
		url += "&brand="+pdto.getBrand();
		url += "&skind="+controlDTO.getSchDTO().getSkind();
		url += "&sch="+controlDTO.getSchDTO().getSch();
		
		String msg = "수정 되었습니다.";
		
		if(mm.ppDetailKname(pdto) != null && !mm.ppDetailKname(pdto).getModel().equals(pdto.getModel())) {
			msg = "이미 등록된 모델명(kor) 입니다.";
		}else if(mm.ppDetailEname(pdto) != null && !mm.ppDetailKname(pdto).getModel().equals(pdto.getModel())) {
			msg = "이미 등록된 모델명(eng) 입니다.";
		}else {
			
			if (!pdto.getFile().getOriginalFilename().equals("")) {
				
				if (Pattern.matches("image/.*", pdto.getFile().getContentType())) {
					FileDTO.fileDelete(controlDTO.getRequest(), pdto.getImg1());
					pdto.setImg1(FileDTO.fileSave(pdto.getFile(), controlDTO.getRequest()));
					mm.ppModify(pdto);
				}else {
					msg = "이미지를 확인해주세요.";
				}
			}else {	
				pdto.setImg1(mm.ppDetail(pdto).getImg1());
				mm.ppModify(pdto);
			}
		}
		
		
		res.put("msg", msg);
		res.put("url", url);
		
		return res;
	}
}
