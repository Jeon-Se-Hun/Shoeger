<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String url = "/shoeger/shop/mainview";
	try{
	String kind = (String)session.getAttribute("kind");
		
		if(kind.equals("관리자")) {
			url = "/admin/template/main/total";
		}
	}catch(Exception e) {}

	response.sendRedirect(url);
%>    
