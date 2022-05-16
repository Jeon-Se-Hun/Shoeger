<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<div>&nbsp;</div>
<div id="mmtitle" >
	<h2>회원상세</h2>
</div>
<div id="mmdetail">
	<div id="mmform1">
		<div>아이디</div>
		<div><label>${mainData.ccDTO.pid}</label></div>
		<div>회원분류</div>
		<div><label>${mainData.ccDTO.kind}</label></div>
		<div>이름</div>
		<div><label>${mainData.ccDTO.pname}</label></div>
		<div>생년월일</div>
		<div><label><fmt:formatDate pattern = "yyyy-MM-dd"  value="${mainData.ccDTO.birth }"/></label></div>
		<div>이메일</div>
		<div><label>${mainData.ccDTO.email}</label></div>
		<div>휴대폰번호</div>
		<div><label>${mainData.ccDTO.phone}</label></div>
		<div>신발사이즈</div>
		<div><label>${mainData.ccDTO.psize}</label></div>
		<div>포인트</div>
		<div><label>${mainData.ccDTO.point}</label></div>
		<div>가입일</div>
		<div><label><fmt:formatDate pattern = "yyyy-MM-dd" value="${mainData.ccDTO.reg_date }"/></label></div>
		<div></div>
		<div><label></label></div>
		<div id="addrbox">주소</div>
		<div id="addrbox2">
			<div><label>${mainData.ccDTO.address1}</label></div>
			<div><label>${mainData.ccDTO.address2}</label></div>
			<div><label>${mainData.ccDTO.address3}</label></div>
		</div>
		<div>카드</div>
		<div><label>${mainData.ccDTO.card}</label></div>
		<div>카드번호</div>
		<div><label>${mainData.ccDTO.cardnum}</label></div>
		<div>계좌</div>
		<div><label>${mainData.ccDTO.account}</label></div>
		<div>계좌번호</div>
		<div><label>${mainData.ccDTO.accountnum}</label></div>
	</div>	
		<div><a href="memberList?page=${param.page}&sdateStr=${param.sdateStr}&edateStr=${param.edateStr}
		&kind=${param.kind}&sch=${param.sch}"><input type="button" id="mmbtn" value="목록" /></a></div>
</div>
