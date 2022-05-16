package aaa.service;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import aaa.model.ClientDTO;
import aaa.model.ClientMapper;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;

import aaa.model.db.ViewMapper;

@Service
public class Shop implements ContentService{

	@Resource
	ViewMapper vm;
	
	@Resource
	ClientMapper cm;
	
	@Override
	public Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if((mDTO.getBrand()==null || mDTO.getBrand().equals("")) && (mDTO.getSch().equals("") || mDTO.getSch()==null)) {
			map.put("spDTO", spDTO);
			map.put("mDTO", mDTO);
			spDTO.init3(vm, map);
			
			if(mDTO.getFilter().equals("popular")) {
				map.put("searchres", vm.getAllprodpop(map));
			}else if(mDTO.getFilter().equals("rel_date")) {
				map.put("searchres", vm.getAllprodrel(map));
			}else if(mDTO.getFilter().equals("reg_date")) {
				map.put("searchres", vm.getAllprodreg(map));
			}else if(mDTO.getFilter().equals("")){
				map.put("searchres", vm.getAllprod(map));
			}
			
			map.put("catelist", vm.catelist());
			cDTO.setPid((String)session.getAttribute("sessionId"));
			map.put("session", cDTO);
			map.put("wlist", cm.miniwish(cDTO));
			
			return map;
			
		}else if((mDTO.getSch().equals("") || mDTO.getSch()==null) && (mDTO.getBrand()!=null || !mDTO.getBrand().equals(""))  ) {
			
			map.put("spDTO", spDTO);
			map.put("mDTO", mDTO);
			spDTO.init(vm, map);
			
			if(mDTO.getFilter().equals("popular")) {
				map.put("searchres", vm.popularfilter(map));
			}else if(mDTO.getFilter().equals("rel_date")) {
				map.put("searchres", vm.rel_datefilter(map));
			}else if(mDTO.getFilter().equals("reg_date")) {
				map.put("searchres", vm.reg_datefilter(map));
			}else if(mDTO.getFilter().equals("")){
				map.put("searchres", vm.searchlist(map));
			}
			
			map.put("catelist", vm.catelist());
			cDTO.setPid((String)session.getAttribute("sessionId"));
			map.put("session", cDTO);
			map.put("wlist", cm.miniwish(cDTO));
			
			return map;
			
		}else if((!mDTO.getSch().equals("") || mDTO.getSch()!=null) && (mDTO.getBrand()==null || mDTO.getBrand().equals(""))){
			
			map.put("spDTO", spDTO);
			map.put("mDTO", mDTO);
			spDTO.init2(vm, map);
			
			if(mDTO.getFilter().equals("popular")) {
				map.put("searchres", vm.popularfilter2(map));
			}else if(mDTO.getFilter().equals("rel_date")) {
				map.put("searchres", vm.rel_datefilter2(map));
			}else if(mDTO.getFilter().equals("reg_date")) {
				map.put("searchres", vm.reg_datefilter2(map));
			}else if(mDTO.getFilter().equals("")){
				map.put("searchres", vm.searchlist2(map));
			}
			
			map.put("catelist", vm.catelist());
			cDTO.setPid((String)session.getAttribute("sessionId"));
			map.put("wlist", cm.miniwish(cDTO));
			
			map.put("session", cDTO);
			
			return map;
		}else {
			map.put("spDTO", spDTO);
			map.put("mDTO", mDTO);
			spDTO.init3(vm, map);
			
			map.put("searchres", vm.getAllprod(map));
			
			map.put("catelist", vm.catelist());
			cDTO.setPid((String)session.getAttribute("sessionId"));

			map.put("session", cDTO);

			map.put("wlist", cm.miniwish(cDTO));

			return map;
		}
	}

}
