package aaa.model;

import lombok.Data;

@Data
public class PPPData {
	String cate, service, service2;

	public PPPData(String cate, String service) {
		super();
		this.cate = cate;
		this.service = service;
	}
	
	public PPPData() {}

	public PPPData(String cate, String service, String service2) {
		super();
		this.cate = cate;
		this.service = service;
		this.service2 = service2;
	}
	
}
