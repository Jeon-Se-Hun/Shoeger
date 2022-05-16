<%@page import="aaa.model.BoardDTO"%>
<%@page import="aaa.model.db.PageDTO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h3 class="signboard">자주 묻는 질문 게시글</h3>
	<div class="total">

		<div align="center">
			<hr style="height: 3px; border: none; background-color: #505050;">
		</div>
		
		<div class="title">${data.bDTO.title }</div>

		
			<div class="kategorie">
				<div class="writer">${data.bDTO.pid }</div>
	
				<div class="viewcnt">조회 ${data.bDTO.cnt }</div>
	
				<div class="date"><fmt:formatDate value="${data.bDTO.reg_date }" pattern="yyyy-MM-dd"/></div>
			</div>
			
			<div class="create">
				<div class="img"><img align="top" alt="" src='<c:url value="/resources/fff/${data.bDTO.upfile }" />'></div>
				
				<div class="contents">${data.bDTO.contentBr }</div>
			</div>

			<div>
				<div class="move" align="right">
					<a href="list?page=${data.pDTO.page }&sch=${param.sch}&kind=${param.kind}">목록</a>
				</div>
			</div>
		</div>
