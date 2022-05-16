<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3 class="signboard">${mainData.rbgusdetail.kind}</h3>

<script>
	function check_onclick() {
		var returnValue = confirm('삭제 하시겠습니까?');

		if (returnValue == true) {
			frm.action = "deleteReg";
			frm.submit();
		}
	}
	
	function answerText() {
		var ansText = document.getElementById('answerText');
		ansText.readOnly = false;
	}
	
	function modifyBtn() {
	      var id = document.getElementById('id').value;
	      var answer = document.getElementById('answerText').value;
	      
	      location.href="answerReg?id=" + id + "&answer=" + answer + "&page=${param.page}&skind=${param.skind}&sch=${param.sch}";
	}
	
</script>
<div class="total">

	<div align="center">
		<hr>
	</div>

	<div class="title">${mainData.rbgusdetail.title}</div>

	<div class="kategorie">
		<div class="writer">${mainData.rbgusdetail.pid.split("@")[0] }</div>

		<div class="viewcnt">조회수 ${mainData.rbgusdetail.cnt }</div>
		
		<div class="date">
			<fmt:formatDate value="${mainData.rbgusdetail.reg_date }"
				pattern="yyyy-MM-dd HH:mm" />
		</div>
		
	</div>

	<div class="create">
		<div class="img">
			<c:choose>
				<c:when test="${mainData.rbgusdetail.upfile != '' && mainData.rbgusdetail.upfile != null }">
					<img src='<c:url value="/resources/fff/${mainData.rbgusdetail.upfile}"/>' />
				</c:when>

				<c:otherwise>
					<img src='' />
				</c:otherwise>
			</c:choose>
		</div>

		<div class="contents">${mainData.rbgusdetail.contentBr }</div>
	</div>

	<form action="" name="frm">
		<input type="hidden" name="id" value="${mainData.rbgusdetail.id}" id="id"/>
		<input type="hidden" name="kind" value="${mainData.rbgusdetail.kind}" />
		<input type="hidden" name="upfile" value="${mainData.rbgusdetail.upfile}">
	</form>


	<c:if test='${mainData.rbgusdetail.kind == "qna"}'>
		<div class="kategorie">
			<div class="writer">운영자 답변</div>
		</div>

		<input type="text" value="${mainData.rbgusdetail.answer}" readonly="readonly" id="answerText" onclick="answerText();" placeholder="내용을 입력하세요">
		<button onclick="modifyBtn()" class="modifyBtn">수정</button>
	</c:if>

	<div class="move">
		<a href="modifyForm?id=${mainData.rbgusdetail.id}&page=${param.page}&skind=${param.skind}&sch=${param.sch}">수정</a>
		<a onclick="check_onclick()">삭제</a> 
		<a href='${mainData.rbgusdetail.kind}?page=${param.page}&skind=${param.skind}&sch=${param.sch}'>목록</a>
	</div>
</div>