<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src='<c:url value = "/my_js/jquery-3.6.0.js"/>'></script>
	<script>
			alert("${mainData.msg}")
			frm.action = "${param.service }"
			frm.submit()
		$(function(){
			/* location.href = "../${mainData.url}" */
		})
	</script>
</head>
<body>
	
	
	<form action="" id="frm" >
		<input type="hidden" name="page" value="${param.page }" />
		<input type="hidden" name="tradeid" value="${param.tradeid }" />
		<input type="hidden" name="kind" value="${param.kind }" />
		<input type="hidden" name="sdateStr" value="${param.sdateStr }" />
		<input type="hidden" name="edateStr" value="${param.edateStr }" />
		<input type="hidden" name="skind" value="${param.skind }" />
		<input type="hidden" name="sch" value="${param.sch }" />
		<input type="hidden" name="service" id="service" value="${param.service }" />
	</form>
</body>
</html>