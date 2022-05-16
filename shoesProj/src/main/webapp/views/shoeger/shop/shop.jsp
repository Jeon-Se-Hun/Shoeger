<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href='<c:url value="/resources/css/shoeger/shop/shoplist.css" />'>

<div id="maintitle">Shop</div>
<div id="catelist">
<div id="brtxt" style="text-align: center">Brand Category</div>
<form action="">
<c:forEach items="${mainData.get('catelist') }" var="item">
	<div id="cate"><a href="shop?brand=${item.ename }&page=1&filter=&sch=">${item.brandprint }</a></div>
</c:forEach>
</form>
</div>
<div id="prodlist"><jsp:include page="shoplist.jsp" /></div>

