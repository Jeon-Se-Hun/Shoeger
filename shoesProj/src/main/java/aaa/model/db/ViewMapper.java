package aaa.model.db;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import aaa.model.PorderDTO;
import aaa.model.StockDTO;

@Mapper
public interface ViewMapper {

	void plusCnt(MainDTO mDTO);

	String schBrand(String model);

	List<MainDTO> recList(MainDTO mDTO);

	List<MainDTO> allprod(MainDTO mDTO);

	List<MainDTO> eachmodel(String brand);

	List<MainDTO> popularlist(MainDTO mDTO);

	List<MainDTO> recentlist(MainDTO mDTO);

	List<MainDTO> newlist(MainDTO mDTO);

	List<BrandDTO> catelist();

	List<MainDTO> searchlist(HashMap<String, Object> map);

	List<MainDTO> searchlist2(HashMap<String, Object> map);

	MainDTO prodInfo(StockDTO sDTO);

	List<MainDTO> stocklist(HashMap<String, Object> map);

	StockDTO stockInfo(StockDTO sDTO);

	void stocksell(StockDTO sDTO);

	void newsell(PorderDTO poDTO);

	MainDTO modelinfo(String model);

	List<MainDTO> popularfilter(HashMap<String, Object> map);

	List<MainDTO> rel_datefilter(HashMap<String, Object> map);

	List<MainDTO> reg_datefilter(HashMap<String, Object> map);

	List<MainDTO> popularfilter2(HashMap<String, Object> map);

	List<MainDTO> rel_datefilter2(HashMap<String, Object> map);

	List<MainDTO> reg_datefilter2(HashMap<String, Object> map);

	List<MainDTO> searchProd(MainDTO mDTO);

	List<MainDTO> getAllprod(HashMap<String, Object> map);

	List<MainDTO> getAllprodpop(HashMap<String, Object> map);

	List<MainDTO> getAllprodrel(HashMap<String, Object> map);

	List<MainDTO> getAllprodreg(HashMap<String, Object> map);

	int stockCnt(HashMap<String, Object> map);

	int totalCntAllprod(HashMap<String, Object> map);

	int totalCnt(HashMap<String, Object> map);

	int totalCnt2(HashMap<String, Object> map);
}