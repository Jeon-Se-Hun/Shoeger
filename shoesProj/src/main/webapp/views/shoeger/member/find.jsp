<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="wrapper">
	<div id="content">

		<c:choose>
			<c:when test="${param.find == 'id'}">
				<h2>ID찾기</h2>
			</c:when>

			<c:otherwise>
				<h2>PW변경</h2>
			</c:otherwise>
		</c:choose>

		<div id="box"></div>
		
	</div>
</div>