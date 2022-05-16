<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	
	function checkSize(input) {
	    if (input.files && input.files[0].size > (8 * 1024 * 1024)) {
	        alert("파일 사이즈가 8mb 를 넘습니다.");
	        input.value = null;
	    }
	}
	
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').css('height', '200px');
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<h3 class="signboard">글쓰기</h3>

<form name="frm" action="insertReg" method="post" enctype="multipart/form-data">
	<input type="hidden" value="${param.kind}" name="kind">
	<input type="hidden" value="운영자" name="pid">
	
	<div class="total">
		<div>
			<hr>
		</div>
		
		<div class="writeTitle">
			<input type="text" name="title" placeholder="제목을 입력하세요"/>
		</div>
		
		<div class="createFile">
			<input type="file" name="ff" onchange="checkSize(this); readURL(this);" accept="image/gif, image/jpeg, image/png" />[이미지 파일만 업로드 해주세요]
			<br>
			<img id="blah"/>
		</div>
		
		<div class="create">
			<textarea class="contents" name="content" cols="30" rows="5" placeholder="내용을 입력하세요"></textarea>
		</div>
	
		<div class="move">
			<input type="button" value="작성" onclick="check_onclick()"/>
			<div><a href="${param.kind}">목록</a></div>
		</div>
	</div>

</form>
