<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	$(function(){
		$.ajax({
         async : false,
         type : 'POST',
         data : JSON.stringify({kind : "관리자"}),
         url : "/adminChk.do",
         contentType : "application/json",
         success : function(data) {
        	 if(data.cnt > 2) {
        		 $('#adminAdd').prop('disabled', true);
        	 }
         },
         error : function(error) {
                alert("error : " + error);
            }
      });
	})
</script>

<div id = "showMember">
	<h3>관리자 설정</h3>
	
	<div id="table1">
		<div class="tttt">아이디</div>
		<div class="tttt">성명</div>
		<div class="tttt">등록일</div>
		<div class="tttt">전화번호</div>
	</div>
	
	<div>
		<c:forEach items="${mainData.mmList }" var="dto">
			<div><a href="shopMemberdetail?pid=${dto.pid }">${dto.pid }</a></div>
			<div>${dto.pname }</div>
			<div><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd" /></div>
			<div>${dto.phone }</div>
		</c:forEach>
	</div>
		
</div>
<div><input type="button" value="추가" onclick="location.href='shopInsertForm'" id="adminAdd"/></div>
