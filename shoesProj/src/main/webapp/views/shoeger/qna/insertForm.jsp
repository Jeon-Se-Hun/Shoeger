<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<h3 class="signboard">QnA 글쓰기</h3>
	
	<form name="frm" action="insertReg" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pid" value="<%=session.getAttribute("sessionId") %>">
	
		<div class="total">
			<div align="center">
				<hr style="height: 3px; border: none; background-color: #505050;">
			</div>
			
			<div class="writeTitle">
				<input type="text" name="title" placeholder="제목을 입력하세요"  value="${param.title }" maxlength="30"/>
			</div>
			
			<div class="createFile">
				<input type="file" name="ff" onchange="checkSize(this); readURL(this);" accept="image/gif, image/jpeg, image/png" />[이미지 파일만 업로드 해주세요]
				<br>
				<img id="blah" src=''/>
			</div>
			
			<div class="create">
				<textarea class="contents" name="content" cols="30" rows="5" placeholder="내용을 입력하세요" maxlength="10000">${param.contents }</textarea>
			</div>
		
			<div class="move" align="right">
				<input type="button" value="작성" onclick="check_onclick()"/>
				<div><a href="list?page=${data.pDTO.page }">목록</a></div>
			</div>
		</div>
	
	</form>