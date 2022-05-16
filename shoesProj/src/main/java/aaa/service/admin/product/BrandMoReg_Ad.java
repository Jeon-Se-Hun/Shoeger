package aaa.service.admin.product;

import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.model.db.BrandDTO;
import aaa.service.admin.ProductService_Ad;

@Service
public class BrandMoReg_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		ProductDTO pdto = controlDTO.getPpDTO();
		BrandDTO brandDTO = controlDTO.getBrandDTO();
		
		String url = "product/brandModify?";
		url += "page="+controlDTO.getPageDTO().getPage();
		url += "&id="+brandDTO.getId();
		url += "&model="+pdto.getModel();
		url += "&brand="+pdto.getBrand();
		url += "&skind="+controlDTO.getSchDTO().getSkind();
		url += "&sch="+controlDTO.getSchDTO().getSch();
		
		BrandDTO chkBrandDTO = mm.brandDetail(brandDTO);
		System.out.println("22"+brandDTO);
		System.out.println("123"+chkBrandDTO);
		
		
		String msg = "수정 되었습니다.";
		if(mm.brandDetailKname(brandDTO) != null && mm.brandDetailKname(brandDTO).getId() != brandDTO.getId()) {
			msg = "이미 등록된 브랜드명(kor) 입니다.";
		}else if(mm.brandDetailEname(brandDTO) != null && mm.brandDetailEname(brandDTO).getId() != brandDTO.getId()) {
			msg = "이미 등록된 브랜드명(eng) 입니다.";
		}else {
			
			if (pdto.getFile().getOriginalFilename() != null && !pdto.getFile().getOriginalFilename().equals("")) {
				
				if (Pattern.matches("image/.*", pdto.getFile().getContentType())) {
					FileDTO.fileDelete(controlDTO.getRequest(), pdto.getImg1());
					brandDTO.setImg(FileDTO.fileSave(pdto.getFile(), controlDTO.getRequest()));
					mm.brandModify(brandDTO);
				}else {
					msg = "이미지를 확인해주세요";
				}
			}else {
				brandDTO.setImg(chkBrandDTO.getImg());
				mm.brandModify(brandDTO);
			}
		}
		
		
		
		res.put("msg", msg);
		res.put("url", url);
		
		return res;
	}
}
