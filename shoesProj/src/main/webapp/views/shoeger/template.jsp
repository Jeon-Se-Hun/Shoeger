<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shoeger</title>

</head>
<body>
	<jsp:include page="inc/script.jsp"></jsp:include>
	<header>
		<jsp:include page="inc/top.jsp"></jsp:include>
	</header>
	
	<section class = "section">
		<div id="mainSection"><jsp:include page="${PPPData.cate}/${PPPData.service}.jsp"></jsp:include></div>
		<div id="miniwish"><jsp:include page="shop/miniwish.jsp"></jsp:include></div>
	</section>

	<footer>
		<jsp:include page="inc/bottom.jsp"></jsp:include>
	</footer>


</body>

</html>