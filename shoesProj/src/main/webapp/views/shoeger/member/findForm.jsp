<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade" data-backdrop="static" data-keyboard="false" id="phoneModal">
	<div class="modal-dialog">
		<div class="modal-content"></div>
	</div>
</div>

<div id="wrapper">
	<div id="content">
		<c:choose>
			<c:when test="${param.find == 'id'}">
				<h2>ID찾기</h2>
			</c:when>
			<c:otherwise>
				<h2>PW찾기</h2>
			</c:otherwise>	
		</c:choose>
	
		<div>
			<h3 class="join_title">
				<label for="phoneNo">휴대전화(하이폰 포함 13자리)</label>
			</h3>
			<span class="box int_mobile"> 
			<input type="tel" name="phone" class="int" maxlength="13" placeholder="전화번호 입력" id="phone">
			<input type="hidden" value="${param.find}" id="find">
			</span>
			<div id="phone_check"></div>
		</div>
	
		<div class="btn_phone">
			<button type="button" id="sendPhoneNumber" onclick="sendPhone();" disabled="disabled">
				<span>휴대폰 인증</span>
			</button>
		</div>
	</div>
</div>