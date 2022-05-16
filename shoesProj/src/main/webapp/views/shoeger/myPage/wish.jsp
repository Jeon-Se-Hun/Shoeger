<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script>
	$(function(){
		$(".modify").click(function(){
			$("#numdata").val($(this).attr("nn"))
			frm.action = "modifyRegwish"
			frm.submit()
		})
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
<form id="frm" action=""  method="post">
	<input type="hidden" id="numdata" name="num" value="">
	<input type="hidden" name="service2" value="${service2 }">
	<div class="rbgus">
	<h1>관심상품</h1><br>
		<c:forEach items="${clidata.wi }" var="dto" varStatus="no">
			<div class="list12">
				<div>
					<c:if test="${dto.sdate!=null }">
						<div class="listin"><img src="<c:url value="/resources/up/soldout.png" />"/></div>
					</c:if>
					<c:if test="${dto.sdate==null }">
						<div class="listin"><img src="<c:url value="/resources/up/used/${dto.img1 }" />"/></div>							
					</c:if>
					
					
					<div class="listin">
						<h5>상품명 : ${dto.kname }</h5>
						<h5>모델명 : ${dto.model }</h5>
						<h5>등급 : ${dto.grade }</h5>
						<h5>사이즈 : ${dto.psize }</h5>
						<c:if test="${dto.sdate!=null }">
							<h5>판매된 상품입니다</h5>
						</c:if>
						<c:if test="${dto.sdate==null }">
						<h5><a href="<c:url value="/shoeger/shop/prodDetail?page=1&model=${dto.model }&productid=${dto.num}" />">자세히 보기</a></h5>							
						</c:if>
						
					</div>
					<div class="listin"><input id="dle" type="button" class="modify" nn="${dto.num }" value="삭제" /></div>
				</div>
			</div>
		</c:forEach>
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
	</div>
</form>
</body>
</html>