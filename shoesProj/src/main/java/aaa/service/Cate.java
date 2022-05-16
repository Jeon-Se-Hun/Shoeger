package aaa.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class Cate implements SubService {

	@Resource
	MyProvider myProvider;
	
	@Override
	public Object execute(String service) {
		CateService ss = myProvider.getContext().getBean(service, CateService.class);
		
		return ss.execute();
	}

}
