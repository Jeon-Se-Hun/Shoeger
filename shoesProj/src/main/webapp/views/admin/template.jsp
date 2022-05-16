<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<title>springMvcProj</title>
	<script src='<c:url value = "/resources/my_js/jquery-3.6.0.js"/>'></script>
	<link rel="stylesheet" href='<c:url value="/resources/css/admin/template.css" />'>
	<link rel="stylesheet" href='<c:url value="/resources/css/admin/${csData.cate }/${csData.service }.css" />'>
</head>
<body>
	<div class = wrapper>
	
		<div id="menuBar">
			<jsp:include page="inc/top.jsp" />
		</div>
		
		
		<div id = "cate"><jsp:include page="inc/cate.jsp" /> </div>
		
		<c:if test="${csData.cate != 'main' }">
			<div id = "ser"><jsp:include page="inc/menu.jsp" /></div>
		</c:if>
		<div id = "body"><jsp:include page="${csData.cate }/${csData.service }.jsp"/></div>
		
		<div id = "footer"></div>
	</div>
	
</body>
</html>