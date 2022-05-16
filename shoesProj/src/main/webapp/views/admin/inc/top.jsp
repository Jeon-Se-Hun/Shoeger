<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
   <script>
      $(function(){
         $("#logout").click(function(){
            location.href = "/shoeger/member/logout"
         })
      })
   </script>
<div id="logo"></div>
<div id = "logout1">
   <img src="<c:url value="/resources/up/logoutiii.PNG"/>"/>
   <div id="logout">로그아웃</div>
   
</div>