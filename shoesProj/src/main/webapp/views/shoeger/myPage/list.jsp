<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script>
	$(function(){
		$(".btn1").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
	})
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="rbgus">
	<h1>문의 내역</h1><br>
		
		<c:forEach items="${clidata.myqna }" var="bDTO" varStatus="no">
		<div class="listhhhhh1">
			<a href="<c:url value="/shoeger/member/center/qna/detail?id=${bDTO.id}&service=${service2 }&page=${clidata.pageDTO.page }" />">${bDTO.title }</a>
		</div>
		<div class="listhhhhh2">
			<fmt:formatDate value="${bDTO.reg_date }"  pattern="yyyy-MM-dd" />
		</div>
		<div class="listhhhhh3">
			<c:if test="${bDTO.answer==null}">답변 대기</c:if>
			<c:if test="${bDTO.answer!=null}">답변 완료</c:if>
			&emsp;&emsp;&emsp;&emsp;&emsp;
		</div>
		<hr>
		<br>
		</c:forEach>
		<form id="frm" action="" method="post">
			<input type="hidden" name="page" id="pageIN" value="${clidata.pageDTO.page }" />
				<div class = "btnDD">
					<c:if test="${clidata.pageDTO.startPage > 1 }">
						<input type="button" class="btn1" dd="${clidata.pageDTO.startPage-1 }" value="&lt" />
					</c:if>
					<c:forEach  begin="${clidata.pageDTO.startPage }" end="${clidata.pageDTO.endPage }" step="1" var="i">
						<% String cc = "btn1"; %>
						<c:if test="${clidata.pageDTO.page == i }">
							<% cc += " btnCC"; %>
						</c:if>
						<input type="button" class="<%=cc %>" dd="${i }" value="${i }" />
					</c:forEach>
					
					<c:if test="${clidata.pageDTO.endPage < clidata.pageDTO.total }">
						<input type="button" class="btn1" dd="${clidata.pageDTO.endPage+1 }" value="&gt" />
					</c:if>	
				</div>
		</form>
	</div>
</body>
</html>