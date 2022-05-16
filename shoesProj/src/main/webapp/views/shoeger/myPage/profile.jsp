<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="/resources/js/shoeger/myPage/profile.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="frm" action="" method="post">
<div class="rbgus">
	<h1>프로필 정보</h1><br>
	<input type="hidden" name="service2" value="${service2 }">
	<h3>로그인 정보</h3>
	<br>
	<h4>이메일 정보</h4>
	<div><input placeholder="" id="email" type="text" name="email" value="${clidata.cli.email}"></div>
	<div id="email_check"></div>
	<br>
	<br>
	<h4>비밀번호</h4><c:if test="${clidata.cli.kind == '네이버'}"><h6>네이버로 로그인한 회원은 비밀번호 변경이 불가합니다</h6></c:if>
	<div><input <c:if test="${clidata.cli.kind == '네이버'}">readonly="readonly"</c:if> placeholder="" id="pw" type="password" name="pw" value="${clidata.cli.pw}"></div>
	<div id="pw_check"></div>
	<br>
	<br>
	<h3>개인정보</h3>
	<br>
	<h4>이름</h4>
	<div><input placeholder="" id="pname" type="text" name="pname" value="${clidata.cli.pname}"></div>
	<br>
	<div>
		<h4>휴대전화(하이폰 포함 13자리)</h4>
		<input placeholder="" readonly="readonly" type="text" name="phone" id="phone" value="${clidata.cli.phone}">
		<div id="phone_check"></div>
	</div>
	<br />
	<div><input type="button" id="sendPhoneNumber" onclick="sendPhone2();"  value="번호 변경"/></div>
	
	<br>
	<h4>사이즈</h4>
	<div><input placeholder="" type="text" maxlength="3" id="psize" name="psize" value="${clidata.cli.psize}"></div>
	<br>
	<div><input type="button" id="modify"  name="${service2 }" value="변경"/><input type="button" id="re" name="${service2 }" value="취소"/></div>
	
</div>
</form>

<div class="modal fade" data-backdrop="static" data-keyboard="false" id="phoneModal">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>


</body>
</html>