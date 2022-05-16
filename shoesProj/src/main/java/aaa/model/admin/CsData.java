package aaa.model.admin;

import lombok.Data;

@Data
public class CsData {
	String cate, service;

	public CsData(String cate, String service) {
		super();
		this.cate = cate;
		this.service = service;
	}

	public CsData() {}
}
