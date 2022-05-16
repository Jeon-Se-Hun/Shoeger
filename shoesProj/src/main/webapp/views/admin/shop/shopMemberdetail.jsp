<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<script>
function check_onclick() {
	var returnValue = confirm('삭제 하시겠습니까?');

	if (returnValue == true) {
		location.href = "shopDeleteReg?pid=" + '${mainData.mmList.pid}';
	}
}

</script>
<div id = "showMember">
	<h3>관리자 설정</h3>
	<a href="shopMember">뒤로가기</a>
	
	<div id="table1">
		<div class="tttt">아이디</div>
		<div class="tttt">비밀번호</div>
		<div class="tttt">성명</div>
		<div class="tttt">전화번호</div>
		<div class="tttt">등록일</div>
	</div>
	<div>
		<div>${mainData.mmList.pid }</div>
		<div>${mainData.mmList.pw.substring(0,2) }******</div>
		<div>${mainData.mmList.pname }</div>
		<div>${mainData.mmList.phone }</div>
		<div><fmt:formatDate value="${mainData.mmList.reg_date }" pattern="yyyy년 MM월 dd일"/></div>
	</div>
	<div id="table1">
		<div class="tttt" id="addr1">주소</div>
		<div class="tttt">이메일</div>
	</div>
	<div>
		<div id="addr1">${mainData.mmList.maddress} </div>
		<div>${mainData.mmList.email }</div>
	</div>
	
</div>

	<div>
		<div class="move">
			<a href="shopModifyForm?pid=${mainData.mmList.pid}">수정</a>
			<a onclick="check_onclick()">삭제</a>
		</div>
	</div>
