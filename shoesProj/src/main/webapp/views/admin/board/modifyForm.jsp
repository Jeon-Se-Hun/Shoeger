<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h3 class="signboard">${mainData.rbgusdetail.title}수정</h3>

	<script>
		function check_onclick() {
			theForm = document.frm;

			if (theForm.title.value.trim() == "") {
				alert("제목이 비어있습니다. 확인해주세요.")
				theForm.title.focus();

			} else if (theForm.content.value.trim() == "") {
				alert("내용이 비어있습니다. 확인해주세요.")
				theForm.content.focus();

			} else {
				$(function() {
					frm.submit()
				})
			}
		}

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#blah').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}

		function checkSize(input) {
			if (input.files && input.files[0].size > (8 * 1024 * 1024)) {
				alert("파일 사이즈가 8mb 를 넘습니다.");
				input.value = null;
			}
		}
	</script>

	<form name="frm" action="modifyReg" method="post" enctype="multipart/form-data">
		<input type="hidden" name="id" value="${mainData.rbgusdetail.id }">  
		<input type="hidden" name="upfile" value="${mainData.rbgusdetail.upfile}">

		<div class="total">
			<div>
				<hr>
			</div>

			<div class="writeTitle">
				<input type="text" name="title" placeholder="제목을 입력하세요" value="${mainData.rbgusdetail.title}" />
			</div>

			<div class="createFile">
				<input type="file" name="ff" onchange="checkSize(this); readURL(this);" accept="image/gif, image/jpeg, image/png" />[이미지 파일만 업로드 해주세요] <br> 
	
				<c:choose>
					<c:when test="${mainData.rbgusdetail.upfile != '' && mainData.rbgusdetail.upfile != null }">
						<img id="blah" src='<c:url value="/resources/fff/${mainData.rbgusdetail.upfile}"/>' />
					</c:when>

					<c:otherwise>
						<img id="blah" src='' />
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="create">
				<textarea class="contents" name="content" cols="30" rows="5" placeholder="내용을 입력하세요">${mainData.rbgusdetail.content }</textarea>
			</div>
			<div class="move">
				<input type="button" value="수정" onclick="check_onclick()" />
				<div>
					<a href="answer?id=${mainData.rbgusdetail.id}&page=${param.page}&skind=${param.skind}&sch=${param.sch}">뒤로</a>
				</div>
			</div>
		</div>

	</form>
</body>
</html>