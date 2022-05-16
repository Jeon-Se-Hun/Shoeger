<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
$(function(){
	var src = $('#asdfasdf').attr("src");
	if(src == '/resources/fff/kream_standard1.png') {
		$('section').css('height', '5700px');
	}
});
</script>
	<h3 class="signboard">안내 게시글</h3>
	
	<div class="total">

		<div align="center">
			<hr>
		</div>
		
		<div class="title">${data.bDTO.title }</div>
		
			<div class="kategorie">
				<div class="writer">${data.bDTO.pid }</div>
	
				<div class="viewcnt">조회 ${data.bDTO.cnt }</div>
	
				<div class="date"><fmt:formatDate value="${data.bDTO.reg_date }" pattern="yyyy-MM-dd"/></div>
			</div>
			
			<div class="create">
				<div class="img">
					<img align="top" id="asdfasdf"  src='<c:url value="/resources/fff/${data.bDTO.upfile }"/>'>
				</div>
				
				<div class="contents">${data.bDTO.contentBr }</div>
			</div>

			<div>
				<div class="move" align="right">
					<a href="list?page=${data.pDTO.page }&sch=${param.sch}&kind=${param.kind}">목록</a>
				</div>
			</div>
		</div>