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
<h1>환불 목록</h1><br>
<a <c:if test="${param.serch == '전체' || param.serch == null}">style="color: #000"</c:if> class="font" href="refund?serch=전체">전체</a>&emsp;&emsp;
<a <c:if test="${param.serch == '취소요청'}">style="color: #000"</c:if> class="font" href="refund?serch=취소요청">취소요청</a>&emsp;&emsp;
<a <c:if test="${param.serch == '환불요청'}">style="color: #000"</c:if> class="font" href="refund?serch=환불요청">환불요청</a>&emsp;&emsp;
<a <c:if test="${param.serch == '완료'}">style="color: #000"</c:if> class="font" href="refund?serch=완료">완료</a>
	<c:forEach items="${clidata.refund }" var="dto" >
		<div class="list12">
			<div>
				<div class="listin"><img src="<c:url value="/resources/up/Thumbnail/${dto.img1 }" />"/></div>
				<div class="listin">
					<h5>배송현황 : ${dto.state }</h5>
					<h5>상품명 : ${dto.kname }</h5>
					<h5>모델명 : ${dto.model }</h5>
					<h5>사이즈 : ${dto.psize }</h5>
					<h5>가격 : ${dto.price }</h5>
					<h5>취소일 : <fmt:formatDate value="${dto.pdate }" pattern="yyyy-MM-dd"/> </h5>
				</div>
			</div>
			
		</div>
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