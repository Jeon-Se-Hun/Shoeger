<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script src="/resources/js/shoeger/myPage/delcli.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form id="frm" action=""  method="post">
	<input type="hidden" name="service2" value="${service2 }">
	<div class="rbgus">
		<h1>MY PAGE</h1><br>
		<h4><a href="<c:url value="/shoeger/myPage/myy/profile" />">프로필</a></h4>
		<div><input readonly="readonly" type="text" placeholder="이름 : ${clidata.cli.pname }"></div>
		<br>
		<div><input readonly="readonly" type="text" placeholder="이메일 : ${clidata.cli.email }"></div>
		<br>
		<div id="clipoint"><input readonly="readonly" type="text" placeholder="포인트 : ${clidata.cli.point }"></div>
		<br>
		<br>
		<h4><a href="<c:url value="/shoeger/myPage/myy/purchase" />">구매 내역</a></h4>
		<div class = "mymain">
			<div><div><div>전체</div><div>${clidata.mymain.sale1 }</div></div></div>
			<div><div><div>주문접수</div><div>${clidata.mymain.sale2 }</div></div></div>
			<div><div><div>준비중</div><div>${clidata.mymain.sale3 }</div></div></div>
			<div><div><div>종료</div><div>${clidata.mymain.sale4 }</div></div></div>
		</div>
		<br>
		<h4><a href="<c:url value="/shoeger/myPage/myy/sale" />">판매 내역</a></h4>
		<div class = "mymain">
			<div><div><div>전체</div><div>${clidata.mymain.pur1 }</div></div></div>
			<div><div><div>미수령</div><div>${clidata.mymain.pur2 }</div></div></div>
			<div><div><div>수령</div><div>${clidata.mymain.pur3 }</div></div></div>
			<div><div><div>검수중</div><div>${clidata.mymain.pur4 }</div></div></div>
			<div><div><div>반환</div><div>${clidata.mymain.pur5 }</div></div></div>
			<div><div><div>종료</div><div>${clidata.mymain.pur6 }</div></div></div>
		</div>
		<br>
		<h4><a href="<c:url value="/shoeger/myPage/myy/refund" />">환불 내역</a></h4>
		<div class="mymain">
			<div><div><div>전체</div><div>${clidata.mymain.ref1 }</div></div></div>
			<div><div><div>취소요청</div><div>${clidata.mymain.ref2 }</div></div></div>
			<div><div><div>환불요청</div><div>${clidata.mymain.ref3 }</div></div></div>
			<div><div><div>종료</div><div>${clidata.mymain.ref4 }</div></div></div>
		</div>
		<br>
		<br>
		<input type="button" id="del" value="회원탈퇴" />
	</div>
</form>
</body>
</html>