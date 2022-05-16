<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<script>
	$(function(){
		$(".btn1").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
		$("#schBtn").click(function() {
			$("#pageIN").val("1");
			$("#sch").val($("#sch1").val());
			$("#skind").val($("#skind1").val());
			frm.submit()
		});
	})
</script>
 
<form action="" id="frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<input type="hidden" name="sch" id="sch" value="${param.sch}"/>
<input type="hidden" name="skind" id="skind" value="${param.skind}"/>
	
	<div id="table1">
		<br>
		<h3>공지사항</h3>
		<br>
		<div>
			조건검색	
		</div>
		<div>
			<div>

				<select id="skind1">
					<option value="title" <c:if test="${param.skind == 'title' }">selected="selected"</c:if>>제목</option>
					<option value="id" <c:if test="${param.skind == 'id' }">selected="selected"</c:if>>번호</option>
					<option value="pid" <c:if test="${param.skind == 'pid' }">selected="selected"</c:if>>id</option>
				</select>
				<input type="text" id="sch1" value="${param.sch }" />
				<input type="button" value="검색" id="schBtn"/>
			</div>
		
		</div>
	</div>
</form>
<div id="table2" >
	<div><input type="button" value="게시물 등록" onclick="location.href='insertForm?kind=notice'"/></div>

	<div id="title">
		<div><input type="checkbox" /></div>
		<div>번호</div>
		<div>제목</div>
		<div>작성자</div>
		<div>작성일</div>
		<div>조회</div>
	</div>
	<div id="date">
		<c:forEach items="${mainData.bblist }" var="dto">
			<div><input type="checkbox" /></div>
			<div>${dto.id }</div>
			<div><a href="answer?page=${mainData.pageDTO.page }&skind=${param.skind}
					&sch=${param.sch }&id=${dto.id }">${dto.title }</a></div>
			<div>${dto.pid }</div>
			<div><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd"/>  </div>
			<div>${dto.cnt }</div>
		</c:forEach>
	</div>
	<div class = "btnDD">
		<c:if test="${mainData.pageDTO.startPage > 1 }">
			<input type="button" class="btn1" dd="${mainData.pageDTO.startPage-1 }" value="&lt" />
		</c:if>
		<c:forEach  begin="${mainData.pageDTO.startPage }" end="${mainData.pageDTO.endPage }" step="1" var="i">
			<% String cc = "btn1"; %>
			<c:if test="${mainData.pageDTO.page == i }">
				<% cc += " btnCC"; %>
			</c:if>
			<input type="button" class="<%=cc %>" dd="${i }" value="${i }" />
		</c:forEach>
		
		<c:if test="${mainData.pageDTO.endPage < mainData.pageDTO.total }">
			<input type="button" class="btn1" dd="${mainData.pageDTO.endPage+1 }" value="&gt" />
		</c:if>	
	</div>
</div>
