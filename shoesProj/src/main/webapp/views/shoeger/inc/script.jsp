<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src='<c:url value = "/resources/my_js/jquery-3.6.0.js"/>'></script>
<script src='<c:url value = "/resources/my_js/jquery-ui.min.js"/>'></script>
<script src='<c:url value = "/resources/js/shoeger/inc/top.js"/>'></script>
<script src='<c:url value = "/resources/js/shoeger/inc/bottom.js"/>'></script>
<script src='<c:url value = "/resources/js/shoeger/shop/miniwish.js"/>'></script>

<c:choose>
	<c:when test="${PPPData2.service != null}">
		<script src='<c:url value = "/resources/js/shoeger/${PPPData2.cate}/${PPPData2.service}.js"/>'></script>
	</c:when>
	
	<c:when test="${PPPData.service2 != null}">
		<script src='<c:url value = "/resources/js/shoeger/${PPPData.cate}/${PPPData.service2}.js"/>'></script>
	</c:when>
	
	<c:otherwise>
		<script src='<c:url value = "/resources/js/shoeger/${PPPData.cate}/${PPPData.service}.js"/>'></script>
	</c:otherwise>
</c:choose>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/inc/top.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/inc/bottom.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/shop/miniwish.css" />'>
<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/template.css" />'>

<c:choose>
	<c:when test="${PPPData2.service != null}">
		<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/${PPPData2.cate}/${PPPData2.service}.css" />'>
	</c:when>
	<c:otherwise>
		<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/${PPPData.cate}/${PPPData.service}.css" />'>
	</c:otherwise>
</c:choose>