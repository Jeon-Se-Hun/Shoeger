package aaa.model;

import lombok.Data;

@Data
public class ShoeData {

	String cate, service;

	public ShoeData(String cate, String service) {
		super();
		this.cate = cate;
		this.service = service;
	}
	
	public ShoeData() {}
}
