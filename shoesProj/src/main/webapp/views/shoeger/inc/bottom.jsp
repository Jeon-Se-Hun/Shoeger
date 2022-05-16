<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach end="3" step="1" begin="1" var="i">
	<div class="modal fade" data-backdrop="static" data-keyboard="false" id='terms${i}'>
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
</c:forEach>
    
<div class="boOut">
	<div class="boBoard">
		<h5>고객센터</h5>
		<a href="/shoeger/member/center/notice/list">공지사항</a><br>
		<a href="/shoeger/member/center/qna/list">QnA</a><br>
		<a href="/shoeger/member/center/fnq/list">자주 묻는 질문</a><br>
		<a href="/shoeger/member/center/info/list">안내</a><br>
	</div>
	
	<div class="boaTag">
		<h5>이용약관</h5>
		<a class="boTerm" onclick="terms(this.id);" id="terms1" data-target="#terms1">개인정보 처리방침</a><br>
		<a class="boTerm" onclick="terms(this.id);" id="terms2" data-target="#terms2">서비스 이용약관</a><br>
		<a class="boTerm" onclick="terms(this.id);" id="terms3" data-target="#terms3">마케팅 수신</a><br>
	</div>
	
	<div id="boText">
		<p>
		Shoeger 주식회사 · 대표: ${schData.bottom.pname} 사업자등록번호: ${schData.bottom.pid}<br>
		사업장소재지: (${schData.bottom.address1}) ${schData.bottom.address2} ${schData.bottom.address3}<br>
		개인정보관리책임자: ${schData.bottom.pname} 호스팅 서비스: 네이버 클라우드 (주)<br>
		Shoeger(주)는 거래과정에서 검수하고 보증하는 내용에 대한 책임은 당사에 있습니다.<br>
		이메일: ${schData.bottom.email}
		</p>
	</div>
</div>