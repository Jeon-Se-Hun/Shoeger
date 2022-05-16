package aaa.service.admin.shop;


import java.util.HashMap;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class ShopStatusReg_Ad implements ShopService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		
		
		ProductDTO pdto = controlDTO.getPpDTO();
		ClientDTO cDTO = controlDTO.getCcDTO();
		System.out.println(pdto.getFile());
		
		
		ClientDTO chk = mm.shopInfo();
		
		if (pdto.getFile().getOriginalFilename() != null && !pdto.getFile().getOriginalFilename().equals("")) {

			if (Pattern.matches("image/.*", pdto.getFile().getContentType())) {
				FileDTO.fileDelete(controlDTO.getRequest(), chk.getCard());
				cDTO.setCard(FileDTO.fileSave(pdto.getFile(), controlDTO.getRequest()));
				res.put("msg", "수정 되었습니다.");
				mm.shopModify(cDTO);
			}else {
				res.put("msg", "이미지를 확인해주세요.");
			}
		}else {	
			cDTO.setCard(chk.getCard());
			res.put("msg", "수정 되었습니다.");
			mm.shopModify(cDTO);
		}
		
		
		
		
		

		res.put("url", "shop/shopStatus");
		return res;
	}

	
}
