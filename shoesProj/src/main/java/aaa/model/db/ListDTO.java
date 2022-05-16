package aaa.model.db;

import java.util.List;

import aaa.model.BoardDTO;
import aaa.model.ClientDTO;
import aaa.model.WishDTO;
import lombok.Data;

@Data
public class ListDTO {
	List<BoardDTO> bbs;
	
	BoardDTO bdto;
	
	PageDTO pdto;
	
	List<WishDTO> wlist;
	
	ClientDTO cdto;
}
