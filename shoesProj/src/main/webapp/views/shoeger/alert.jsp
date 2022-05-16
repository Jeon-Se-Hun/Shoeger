<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
	var aaa = "<c:out value='${param.service2}'/>";
		
	alert('${clidata.msg}');
	location.href = "../myy/"+aaa;
	if(aaa=='main'){
		location.href = "/shoeger/member/logout";
	}
</script>
