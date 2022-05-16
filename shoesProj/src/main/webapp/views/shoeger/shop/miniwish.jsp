<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${PPPData.service != 'center'}">
	<c:if test="${mainData.wlist != null && mainData.wlist.size() != '0' }">
		<div id="zldrbgus">
		<div id="aa">찜한 상품</div>
		
			<c:forEach items="${mainData.wlist }" var="item">
			<a href='<c:url value="/shoeger/shop/prodDetail?model=${item.model }&productid=${item.num }&page=1" />'><img id="dd" src="<c:url value="/resources/up/used/${item.img1 }" />" alt="" /></a>
			
			</c:forEach>
		
		</div>
	
	</c:if>
	<c:if test="${clidata.wlist != null && clidata.wlist.size() != '0' }">
		<div id="zldrbgus">
		<div id="aa">찜한 상품</div>
		
			<c:forEach items="${clidata.wlist }" var="item">
			<a href='<c:url value="/shoeger/shop/prodDetail?model=${item.model }&productid=${item.num }&page=1" />'><img id="dd" src="<c:url value="/resources/up/used/${item.img1 }" />" alt="" /></a>
			
			</c:forEach>
		
		</div>
	
	</c:if>


</c:if>



<div id="totopouter">
<button type="button" id="totop" onclick="goTop()"><img id= "totopimg" src="<c:url value="/resources/up/totopimg.png" />"/></button>
</div>