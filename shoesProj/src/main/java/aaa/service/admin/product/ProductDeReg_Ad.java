package aaa.service.admin.product;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import aaa.model.ProductDTO;
import aaa.model.admin.AdminMapper;
import aaa.model.admin.ControllDTO;
import aaa.model.admin.FileDTO;
import aaa.service.admin.ProductService_Ad;

@Service
public class ProductDeReg_Ad implements ProductService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		HashMap<String, Object> res = new HashMap<>();
		
		ProductDTO pdto = controlDTO.getPpDTO();
		
		System.out.println(pdto);
		
		FileDTO.fileDelete(controlDTO.getRequest(), pdto.getImg1());
		mm.ppDelete(pdto);
		
		res.put("msg", "삭제되었습니다.");
		res.put("url", "product/productList");
		return res;
	}

	
}
