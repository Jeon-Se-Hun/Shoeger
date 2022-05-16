package aaa.model.admin;

import java.util.HashMap;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.model.BoardDTO;
import aaa.model.ClientDTO;
import aaa.model.Menu;
import aaa.model.OperationDTO;
import aaa.model.OrderDTO;
import aaa.model.ProductDTO;
import aaa.model.SecessionDTO;
import aaa.model.StockDTO;
import aaa.model.TradeDTO;
import aaa.model.VisitorDTO;
import aaa.model.db.BrandDTO;

@Mapper
public interface AdminMapper {

	List<CalculateDTO> ttTot(SchDTO schDTO);

	CalculateDTO ttTotCnt(SchDTO schDTO);

	List<Menu> getAdminMenu(String cate);

	List<ProductDTO> ppList(ControllDTO controlDTO);

	int ppListCnt(ControllDTO controlDTO);

	ProductDTO ppDetail(ProductDTO ppDTO);

	ProductDTO ppDetailKname(ProductDTO ppDTO);

	ProductDTO ppDetailEname(ProductDTO ppDTO);

	int ppDelete(ProductDTO ppDTO);

	int ppModify(ProductDTO ppDTO);

	List<StockDTO> ssList(ControllDTO controlDTO);

	int ssListCnt(ControllDTO controlDTO);

	StockDTO ssDetail(StockDTO ssDTO);

	int ssInsert(StockDTO ssDTO);

	int ssModify(StockDTO ssDTO);

	List<OrderDTO> ooList(ControllDTO controlDTO);

	int ooListCnt(ControllDTO controlDTO);

	List<OrderDTO> ooListCan(ControllDTO controlDTO);

	int ooListCanCnt(ControllDTO controlDTO);

	OrderDTO ooDetail(OrderDTO ooDTO);

	int ooInsert(OrderDTO ooDTO);

	int ooModify(OrderDTO ooDTO);

	int ooModifyPP(OrderDTO ooDTO);

	int ooCancel(OrderDTO ooDTO);

	List<String> brandList();

	List<BrandDTO> brandDTOList(ControllDTO controlDTO);

	int brandDTOCnt(ControllDTO controlDTO);

	int brandInsert(BrandDTO brandDTO);

	int brandDelete(BrandDTO brandDTO);

	BrandDTO brandDetail(BrandDTO brandDTO);

	BrandDTO brandDetailEname(BrandDTO brandDTO);

	BrandDTO brandDetailKname(BrandDTO brandDTO);

	int brandModify(BrandDTO brandDTO);

	ShowStateDTO showState();

	TotDTO salesTot(DateDTO dateDTO);

	TotDTO clientTot(DateDTO dateDTO);

	TotDTO comClientTot(DateDTO dateDTO);

	TotDTO visitTot(DateDTO dateDTO);

	List<BoardDTO> mainBoardlist();

	List<ClientDTO> adminList();

	ClientDTO shopInfo();

	void shopModify(ClientDTO ccDTOs);

	List<OperationDTO> operList1();

	List<OperationDTO> operList2();

	int operinsert(OperationDTO operDTO);

	List<BoardDTO> bblist(ControllDTO controlDTO);

	int bblistCnt(ControllDTO controlDTO);

	int proinsert(ProductDTO ppDTO);

	int answermodify(BoardDTO bDTO);

	BoardDTO rbgusdetail(BoardDTO id);

	List<ClientDTO> cclist(ControllDTO controlDTO);

	int cclistCnt(ControllDTO controlDTO);

	ClientDTO ccDetail(ClientDTO ccDTO);

	ClientDTO memberdetail(ClientDTO cDTO);

	int memberinsert(ClientDTO cDTO);

	void bbInsert(BoardDTO bDTO);

	void bbDelete(BoardDTO bDTO);

	void bbModify(BoardDTO bDTO);

	int ttInsert(TradeDTO ttDTO);

	int ttModify(TradeDTO ttDTO);

	TradeDTO ttDetail(TradeDTO ttDTO);

	ClientDTO ccdetail(ClientDTO ccDTO);

	List<VisitorDTO> visitlist(ControllDTO controlDTO);

	int visitlistCnt(ControllDTO controlDTO);

	int totalCnt(HashMap<String, Object> map);

	List<SecessionDTO> seclist(ControllDTO controlDTO);

	int seclistCnt(ControllDTO controlDTO);

	SecessionDTO secdetail(SecessionDTO secDTO);

	void ccDelete(ClientDTO cDTO);

	void ccModify(ClientDTO cDTO);

	void ccModifyPoint(ClientDTO cDTO);

	void addAdimin(ClientDTO cDTO);
}
