package aaa.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import aaa.model.ClientDTO;
import aaa.model.PorderDTO;
import aaa.model.ShopPageDTO;
import aaa.model.StockDTO;
import aaa.model.WishDTO;
import aaa.model.db.MainDTO;


public interface ContentService {

	Object execute(MainDTO mDTO, StockDTO sDTO, ClientDTO cDTO, HttpSession session, WishDTO wDTO, PorderDTO poDTO, ShopPageDTO spDTO);
	
}
