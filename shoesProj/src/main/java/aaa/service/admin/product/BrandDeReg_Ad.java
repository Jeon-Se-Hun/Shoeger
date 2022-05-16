package aaa.service.admin.product;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.model.db.BrandDTO;
import aaa.service.admin.ProductService_Ad;

@Service
public class BrandDeReg_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		BrandDTO dto = controlDTO.getBrandDTO();
		
		
		FileDTO.fileDelete(controlDTO.getRequest(), dto.getImg());

		mm.brandDelete(dto);
		
		res.put("msg", "삭제되었습니다.");
		res.put("url", "product/brand");
		return res;
	}

	
}
