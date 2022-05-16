package aaa.model.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.PathVariable;

import aaa.model.BoardDTO;
import aaa.model.ClientDTO;
import aaa.model.OperationDTO;
import aaa.model.OrderDTO;
import aaa.model.AdPageDTO;
import aaa.model.ProductDTO;
import aaa.model.SecessionDTO;
import aaa.model.StockDTO;
import aaa.model.TradeDTO;
import aaa.model.VisitorDTO;
import aaa.model.db.BrandDTO;
import lombok.Data;

@Data
public class ControllDTO {
	HttpServletRequest request;
	SchDTO schDTO;
	ClientDTO ccDTO;
	OperationDTO operDTO;
	ProductDTO ppDTO;
	OrderDTO ooDTO;
	StockDTO ssDTO;
	BoardDTO bbDTO;
	TradeDTO ttDTO;
	VisitorDTO vvDTO;
	AdPageDTO pageDTO;
	SecessionDTO secDTO;
	BrandDTO brandDTO;
}
