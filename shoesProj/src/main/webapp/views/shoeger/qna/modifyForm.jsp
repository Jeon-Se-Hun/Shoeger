<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
	<h3 class="signboard">QnA 수정</h3>
	
<form name="frm" action="modifyReg" method="post" enctype="multipart/form-data">
	<input type="hidden" name="id" value="${data.bDTO.id }">
	<input type="hidden" name="page" value="${data.pDTO.page }">
	<input type="hidden" name="pid" value="<%=session.getAttribute("sessionId") %>">
	<input type="hidden" name="upfile" value="${data.bDTO.upfile }">
	<input type="hidden" name="sch" value="${param.sch}">
	<input type="hidden" name="kind" value="${param.kind }">
	<input type="hidden" name="service" value="${param.service}">
	
		<div class="total">
			<div align="center">
				<hr style="height: 3px; border: none; background-color: #505050;">
			</div>
			
			<div class="writeTitle">
				<input type="text" name="title" placeholder="제목을 입력하세요" value="${data.bDTO.title }" />
			</div>

			<div class="createFile">
				<input type="file" name="ff" onchange="checkSize(this); readURL(this);" accept="image/gif, image/jpeg, image/png" />[이미지 파일만 업로드 해주세요]
				<br>
				<c:choose>
					<c:when test="${data.bDTO.upfile != '' && data.bDTO.upfile != null }">
						<img id="blah" src='<c:url value="/resources/fff/${data.bDTO.upfile}"/>'/>
					</c:when>
					
					<c:otherwise>
						<img id="blah"  src=''/>
					</c:otherwise>
				</c:choose>
			</div>
			
			<div class="create">
				<textarea class="contents" name="content" cols="30" rows="5" placeholder="내용을 입력하세요">${data.bDTO.content }</textarea>
			</div>

			<div class="move" align="right">
				<input type="button" value="수정" onclick="check_onclick()"/> 
				<div><a href="detail?id=${data.bDTO.id}&page=${data.pDTO.page}&sch=${param.sch}&kind=${param.kind}&service=${param.service}">뒤로</a></div>
			</div>
		</div>

</form>