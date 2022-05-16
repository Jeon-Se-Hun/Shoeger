<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<script>
	$(function(){
		
		$(".btn").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
	})
	
</script>
<div>&nbsp;</div>
<div align="center">
	<h2>방문자 현황</h2>
</div>

<form action="" id = "frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<div id="visitlist">
	<div id="visittitle" >
		<div>#</div>
		<div>방문자ID</div>
		<div>방문자IP</div>
		<div>브라우저정보</div>
		<div>접속시간</div>
	</div>
	<div id="visitdata">
		<c:forEach var="dto" items="${mainData.vvDTO}" varStatus="i">
			<div>${i.index+1+mainData.pageDTO.start}</div>
			<div>${dto.visit_id}</div>
			<div>${dto.visit_ip}</div>
			<div>${dto.visit_agent}</div>
			<div><fmt:formatDate pattern = "yyyy-MM-dd-HH:mm:ss" value="${dto.visit_time}"/></div>
		</c:forEach>
	</div>
		<div class="btnDD">
		<c:if test="${mainData.pageDTO.startPage > 1 }">
			<input type="button" class="btn" dd="${mainData.pageDTO.startPage-1 }" value="&lt" />
		</c:if>
		<c:forEach  begin="${mainData.pageDTO.startPage }" end="${mainData.pageDTO.endPage }" step="1" var="i">
			<% String cc = "btn"; %>
			<c:if test="${mainData.pageDTO.page == i }">
				<% cc += " btnCC"; %>
			</c:if>
			<input type="button" class="<%=cc %>" dd="${i }" value="${i }" />
		</c:forEach>
		
		<c:if test="${mainData.pageDTO.endPage < mainData.pageDTO.total }">
			<input type="button" class="btn" dd="${mainData.pageDTO.endPage+1 }" value="&gt" />
		</c:if>	
	</div>
</div>

</form>