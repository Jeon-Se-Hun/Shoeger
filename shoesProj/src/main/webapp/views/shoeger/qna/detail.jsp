<%@page import="aaa.model.BoardDTO"%>
<%@page import="aaa.model.db.PageDTO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<h3 class="signboard">QnA 게시글</h3>
	
	<div class="total">

		<div align="center">
			<hr style="height: 3px; border: none; background-color: #505050;">
		</div>
		<div class="title">${data.bDTO.title }</div>

		<div class="kategorie">
			<div class="writer">${data.bDTO.pid.split("@")[0] }</div>

			<div class="viewcnt">조회 ${data.bDTO.cnt }</div>

			<div class="date">
				<fmt:formatDate value="${data.bDTO.reg_date }" pattern="yyyy-MM-dd" />
			</div>
		</div>
	
		<div class="create">
			<div class="img">
				<c:choose>
					<c:when test="${data.bDTO.upfile != '' && data.bDTO.upfile != null}">
						<img src='<c:url value="/resources/fff/${data.bDTO.upfile }"/>' />
					</c:when>
	
					<c:otherwise>
						<img src='' />
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="contents">${data.bDTO.contentBr }</div>
		</div>

		<c:if test="${data.bDTO.answer != '' and data.bDTO.answer != null}">
			<div class= "kategorie"><div class="writer">운영자 답변</div></div>
			<div class="create">
				<div class="contents">${data.bDTO.answer }</div>
			</div> 
		</c:if>
		
		<div>
				<div class="move" align="right">
				
					<%
						HashMap map = (HashMap)request.getAttribute("data");
						BoardDTO bDTO = (BoardDTO)map.get("bDTO");
						PageDTO pDTO = (PageDTO)map.get("pDTO");
						
						if(session.getAttribute("sessionId") != null && session.getAttribute("sessionId") != "" && session.getAttribute("sessionId").equals(bDTO.getPid())) { // 글 작성자와 같아야함
					%>	
						<%="<a href='modifyForm?id="+bDTO.getId()+"&page="+pDTO.getPage()+"&pid="+bDTO.getPid()+"&sch="+ request.getParameter("sch") + "&kind=" + request.getParameter("kind")+ "&service=" + request.getParameter("service") +"'>수정</a>" %>
					<%
						}
					%>
				<c:choose>
					<c:when test="${param.service== 'null' || param.service== null }">
	                  <a href="list?page=${data.pDTO.page}&sch=${param.sch}&kind=${param.kind}">목록</a>
					</c:when>
				
					<c:otherwise>
	                  <a href="<c:url value="/shoeger/myPage/myy/list?page=${data.pDTO.page}" />">목록</a>
					</c:otherwise>
				</c:choose>
					
				</div>
			</div>
		</div>