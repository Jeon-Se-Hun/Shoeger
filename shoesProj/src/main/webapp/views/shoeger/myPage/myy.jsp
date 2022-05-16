<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
<div class="all">
	<div class="list">
		<div><a href="main"><img src="<c:url value="/resources/fff/mypage.jpg" />"></a></div>
		<br>
		<div><a class="font" href="purchase">구매 내역</a></div>
		<div><a class="font" href="sale">판매 내역</a></div>
		<div><a class="font" href="refund">환불 내역</a></div>
		<div><a class="font" href="wish">관심 상품</a></div>
		<br>
		<div class="font" id="myimpo">내 정보</div><br>
		<div><a class="font" href="profile">프로필 정보</a></div>
		<div><a class="font" href="address">주소록</a></div>
		<div><a class="font" href="payment">결제 정보</a></div>
		<div><a class="font" href="account">판매 정산 계좌</a></div>
		<div><a class="font" href="list">문의 내역</a></div>
	</div>
		<div class="body"><jsp:include page="${PPPData.service2 }.jsp"></jsp:include></div>
	
</div>

</body>
</html>