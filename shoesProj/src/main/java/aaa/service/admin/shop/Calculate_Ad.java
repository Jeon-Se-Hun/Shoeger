package aaa.service.admin.shop;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Service;

import aaa.model.admin.AdminMapper;
import aaa.model.admin.CalculateDTO;
import aaa.model.admin.ControllDTO;
import aaa.service.admin.ShopService_Ad;

@Service
public class Calculate_Ad implements ShopService_Ad{

	@Resource
	AdminMapper mm;
	
	@Override
	public Object execute(ControllDTO controlDTO) {
		if(controlDTO.getSchDTO().getSkind() == null || controlDTO.getSchDTO().getSkind().equals("")) {
			controlDTO.getSchDTO().setSkind("hh");
		}
		
		
		if(controlDTO.getSchDTO().getSdate() == null) {
			Date date = new Date();
			Date date1 = new Date();
			date.setSeconds(0);
			date.setMinutes(0);
			date.setHours(0);
			date1.setTime(date.getTime());
			date1.setDate(date1.getDate()+1);
			controlDTO.getSchDTO().setSdate(date);
			controlDTO.getSchDTO().setEdate(date1);
		}
		
		HashMap<String, String> ymdh = new HashMap<>();
		ymdh.put("yy", "%Y");
		ymdh.put("mm", "%Y%m");
		ymdh.put("dd", "%Y%m%d");
		ymdh.put("hh", "%Y%m%d%H");
		
		HashMap<String, Integer> cnt = new HashMap<>();
		cnt.put("yy", controlDTO.getSchDTO().getEdate().getYear() - controlDTO.getSchDTO().getSdate().getYear());
		cnt.put("mm", 12);
		
		Date date = new Date();
		date.setTime(controlDTO.getSchDTO().getSdate().getTime());
		date.setMonth(date.getMonth()+1);
		date.setDate(0);
		cnt.put("dd", date.getDate());
		cnt.put("hh", 24);
		
		HashMap<String, Integer> max = new HashMap<>();
		max.put("yy", 100000000);
		max.put("mm", 10000000);
		max.put("dd", 5000000);
		max.put("hh", 1000000);

		
		
		
		
		
		
		HashMap<String, Object> res = new HashMap<>();
		
		controlDTO.getSchDTO().setSch(ymdh.get(controlDTO.getSchDTO().getSkind()));
		controlDTO.getSchDTO().setKind("매출");
		List<CalculateDTO> salsList = mm.ttTot(controlDTO.getSchDTO());
		res.put("salsCnt", mm.ttTotCnt(controlDTO.getSchDTO()));
		controlDTO.getSchDTO().setKind("매입");
		List<CalculateDTO> purList = mm.ttTot(controlDTO.getSchDTO());
		res.put("purCnt", mm.ttTotCnt(controlDTO.getSchDTO()));
		controlDTO.getSchDTO().setKind("취소");
		List<CalculateDTO> cancelList = mm.ttTot(controlDTO.getSchDTO());
		res.put("cancelCnt", mm.ttTotCnt(controlDTO.getSchDTO()));
		res.put("max", max.get(controlDTO.getSchDTO().getSkind()));
		

		

		int [] ss = new int[cnt.get(controlDTO.getSchDTO().getSkind())];
		int [] pp = new int[cnt.get(controlDTO.getSchDTO().getSkind())];
		int [] cc = new int[cnt.get(controlDTO.getSchDTO().getSkind())];
		JSONArray jlabel = new JSONArray();
		
		JSONArray jsalsdata = new JSONArray();
		JSONArray jpurdata = new JSONArray();
		JSONArray jcancerdata = new JSONArray();
		
		for (int i = 1; i <= ss.length; i++) {
			if(controlDTO.getSchDTO().getSkind().equals("yy")) {
				jlabel.add((controlDTO.getSchDTO().getEdate().getYear()+1900-ss.length+i-1) + "년");
				for (CalculateDTO dto : salsList) {
					if((controlDTO.getSchDTO().getEdate().getYear()+1900-ss.length+i-1) == dto.getYy()) {
						ss[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : purList) {
					if((controlDTO.getSchDTO().getEdate().getYear()+1900-ss.length+i-1) == dto.getYy()) {
						pp[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : cancelList) {
					if((controlDTO.getSchDTO().getEdate().getYear()+1900-ss.length+i-1) == dto.getYy()) {
						cc[i-1] = dto.getTot();
					}
				}
			}else if(controlDTO.getSchDTO().getSkind().equals("mm")) {
				jlabel.add(i+"월");
				for (CalculateDTO dto : salsList) {
					if(i == dto.getMm()) {
						ss[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : purList) {
					if(i == dto.getMm()) {
						pp[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : cancelList) {
					if(i == dto.getMm()) {
						cc[i-1] = dto.getTot();
					}
				}
			}else if(controlDTO.getSchDTO().getSkind().equals("dd")) {
				jlabel.add(i+"일");
				for (CalculateDTO dto : salsList) {
					if(i == dto.getDd()) {
						ss[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : purList) {
					if(i == dto.getDd()) {
						pp[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : cancelList) {
					if(i == dto.getDd()) {
						cc[i-1] = dto.getTot();
					}
				}
			}else if(controlDTO.getSchDTO().getSkind().equals("hh")) {
				jlabel.add(i+"시");
				for (CalculateDTO dto : salsList) {
					if(i == dto.getHh()) {
						ss[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : purList) {
					if(i == dto.getHh()) {
						pp[i-1] = dto.getTot();
					}
				}
				for (CalculateDTO dto : cancelList) {
					if(i == dto.getHh()) {
						cc[i-1] = dto.getTot();
					}
				}
			}
		}
		
		for (int ii : ss) {
			jsalsdata.add(ii);
		}
		for (int ii : pp) {
			jpurdata.add(ii);
		}
		
		for (int j = 0; j < cc.length; j++) {
			cc[j] = ss[j] - pp[j];
			jcancerdata.add(cc[j]);
		}
		
//		for (int ii : cc) {
//			jcancerdata.add(ii);
//		}
		
		
		res.put("ssdata", jsalsdata);
		res.put("ppdata", jpurdata);
		res.put("ccdata", jcancerdata);
		res.put("label", jlabel);

		return res;
	}

	
}
