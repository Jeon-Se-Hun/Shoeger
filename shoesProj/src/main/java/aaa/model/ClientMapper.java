package aaa.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClientMapper {
   
   ClientDTO shopInfo();
   
   ClientDTO idChk(ClientDTO cDTO);
      
   ClientDTO login(ClientDTO cDTO);
   
   ClientDTO joinChk(ClientDTO cDTO);
   
   ClientDTO clientChk(ClientDTO cDTO);
   
   void changePw(ClientDTO cDTO);
   
   ClientDTO client(ClientDTO cDTO);
   
   void join(ClientDTO cDTO);
   
   TradeDTO trade(ClientDTO cDTO);
   
   List<WishDTO> wish(HashMap<String, Object> map);
   
   int wishdel(WishDTO bDTO);
   
   MyDTO mymain(ClientDTO cDTO);
   
   int email(ClientDTO cDTO);
   
   int payment(ClientDTO cDTO);
   
   int account(ClientDTO cDTO);
   
   int address(ClientDTO cDTO);
   
   List<BoardDTO> bblist(HashMap<String, Object> map);

   BoardDTO bbdetail(BoardDTO bDTO);

   int totalCnt(HashMap<String, Object> map);

   int bbDelete(BoardDTO bDTO);

   void bbInsert(BoardDTO bDTO);

   int bbModify(BoardDTO bDTO);

   void addCount(BoardDTO bDTO);
   
   List<PorderDTO> purchase(HashMap<String, Object> map);
   
   List<PorderDTO> sale(HashMap<String, Object> map);

   List<PorderDTO> sale1(ClientDTO cDTO);
   
   
   
   void neworder(PorderDTO oDTO);
   
   List<WishDTO> miniwish(ClientDTO cDTO);
   
   void newwish(WishDTO wDTO);
   
   void pointuse(PorderDTO poDTO);
   
   void newtrade(TradeDTO tdTO);
   
   void visitData(VisitorDTO vDTO);
   
   int pordermodify(PorderDTO pDTO);
   
   List<PorderDTO> refund(HashMap<String, Object> map);
   
   int addAdmin(ClientDTO cDTO);
   
   SecessionDTO secession(ClientDTO cDTO);
   
   int addsece(SecessionDTO sDTO);
   
   int delsece(ClientDTO cDTO);
   
   List<BoardDTO> myqna(HashMap<String, Object> map);
   
   int saleCnt(ClientDTO cDTO);
   
   int purchaseCnt(ClientDTO cDTO);
   
   int refundCnt(ClientDTO cDTO);
   
   int wishCnt(ClientDTO cDTO);
   
   int myqnaCnt(ClientDTO cDTO);
   
   int salecateCnt(ClientDTO cDTO);
   
   int purchasecateCnt(ClientDTO cDTO);
   
   int refundcateCnt(ClientDTO cDTO);
   
   List<PorderDTO> purchasecate(HashMap<String, Object> map);
   
   List<PorderDTO> salecate(HashMap<String, Object> map);
   
   List<PorderDTO> refundcate(HashMap<String, Object> map);
}