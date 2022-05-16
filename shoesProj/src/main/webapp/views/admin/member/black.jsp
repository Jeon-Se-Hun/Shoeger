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
		if(${param.kind == null}){
			$("#kind").val("")
		    frm.submit()
		}
		$("#search").click(function(){
			$("#pageIN").val("1")
			$("#kind").val($("#kind1").val())
			$("#sch").val($("#sch1").val())
			
			frm.submit()
		})
	})

</script>
<div>&nbsp;</div>
<div align="center">
	<h2>탈퇴회원</h2>
</div>
<form action="" method="" id="frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<input type="hidden" name="kind" id="kind" value="${param.kind }" />
<input type="hidden" name="sch" id="sch" value="${param.sch }" />
<div id="dropsch">
	<div id="dropschbox1">조건검색</div>
	<div id="dropschbox2">
		<select id="kind1">
			<option value="pid"<c:if test="${param.kind == 'pid' }">selected="selected"</c:if>>아이디</option>
			<option value="pname"<c:if test="${param.kind == 'pname' }">selected="selected"</c:if>>고객명</option>
			<option value="email"<c:if test="${param.kind == 'email' }">selected="selected"</c:if>>이메일</option>
			<option value="phone"<c:if test="${param.kind == 'phone' }">selected="selected"</c:if>>핸드폰번호</option>
		</select>
		<input type="text" id="sch1" value="${param.sch}"/>
		<input type="submit" id="search" value="검색"/>
	</div>
</div>

<div id="droplist" >
	<div id="droptitle" >
		<div>#</div>
		<div>아이디</div>
		<div>이름</div>
		<div>이메일</div>
		<div>핸드폰번호</div>
		<div>포인트</div>
		<div>탈퇴일</div>
		<div>상세보기</div>
	</div>
	<div id="dropdata">
		<c:forEach var="dto" items="${mainData.list}" varStatus="i">
			 <div>${i.index+1+mainData.pageDTO.start}</div>
			 <div>${dto.pid}</div>
			 <div>${dto.pname}</div>
			 <div>${dto.email}</div>
			 <div>${dto.phone}</div>
			 <div>${dto.point}</div>
			 <div><fmt:formatDate pattern = "yyyy/MM/dd" value="${dto.reg_date}"/></div>
			<div><a href="blackDetail?page=${param.page}&pid=${dto.pid }&kind=${param.kind}&
			sch=${param.sch}"><input type="button" value="상세보기"></a></div>
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