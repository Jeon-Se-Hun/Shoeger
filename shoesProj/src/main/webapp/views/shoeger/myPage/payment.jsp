<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="/resources/js/shoeger/myPage/payment.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="rbgus">
	<h1>결제 정보</h1>
	<h6>수수료(페널티, 착불배송비 등)가 정산되지 않을 경우, 별도 고지 없이 해당 금액을 결제 시도할 수 있습니다.</h6>
	<br>
	<h3>기본 정보</h3>
	<br>
	<input type="text" readonly="readonly" placeholder="은행 : ${clidata.cli.card}">
	<br>
	<br>
	<input type="text" readonly="readonly" placeholder="카드번호 : ${clidata.cli.cardnum}">
</div>

<form id="frm" action=""  method="post">
	<input type="hidden" name="service2" value="${service2 }">
<div class="rbgus">
	<br>
	<br>
	<h3>변경 정보</h3>
	<br>
	<h4>은행</h4>
	<select id="card" name="card" size="1">
		<option value="">선택하세요</option>
		<option value="삼성">삼성</option>
		<option value="국민">국민</option>
		<option value="우리">우리</option>
		<option value="시티">시티</option>
		<option value="새마을">새마을</option>
		<option value="농협">농협</option>
	</select>
	<br>
	<br>
	<h4>카드번호</h4>
	<div><input type="text" id="cardnum" size="20" name="cardnum" value="" onkeyup="validatecardnumber(this.value=this.value.replace(/[^0-9]/g,''))"></div>
	<br>
	<p id="notice">(카드 번호가 입력되지 않았습니다)</p>
	<br>
	<div><input type="button" id="modify" disabled="disabled"  name="${service2 }" value="변경"/></div>
</div>
</form>
 


</body>
</html>