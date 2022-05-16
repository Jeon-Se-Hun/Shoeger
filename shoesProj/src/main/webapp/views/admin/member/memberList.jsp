<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%
Date now = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
String today = sf.format(now);

Calendar day = Calendar.getInstance();
day.add(Calendar.DATE , -1);
String yesterday = sf.format(day.getTime());

Calendar week = Calendar.getInstance();
week.add(Calendar.DATE , -7);
String beforeWeek = sf.format(week.getTime());

Calendar month = Calendar.getInstance();
month.add(Calendar.DATE , -30);
String beforemonth = sf.format(month.getTime());
%>
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>

<script src='<c:url value="/resources/my_js/bootstrap-datepicker.min.js"/>' ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>

<script>
	$(function(){
		$("#allday").click(function(){
			 $("#sdateStr1").val("")
		     $("#edateStr1").val("")
		})
		if(${param.sdateStr == null}){
			$("#sdateStr1").val("")
		    $("#edateStr1").val("")
		    frm.submit()
		}
		$("#today").click(function(){
		      $("#sdateStr1").val("<%=today %>")
		      $("#edateStr1").val("<%=today %>")
		})
		$("#yesterday").click(function(){
		      $("#sdateStr1").val("<%=yesterday %>")
		      $("#edateStr1").val("<%=today %>")
		})
		$("#beforeWeek").click(function(){
		      $("#sdateStr1").val("<%=beforeWeek %>")
		      $("#edateStr1").val("<%=today %>")
		})
		$("#beforemonth").click(function(){
		      $("#sdateStr1").val("<%=beforemonth %>")
		      $("#edateStr1").val("<%=today %>")
		})
		$(".btn").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		$("#search").click(function(){
			$("#pageIN").val("1")
			$("#sdateStr").val($("#sdateStr1").val())
			$("#edateStr").val($("#edateStr1").val())
			$("#kind").val($("#kind1").val())
			$("#sch").val($("#sch1").val())
			
			frm.submit()
		})


		$('#sdateStr1').datepicker({
			   format: "yyyy-mm-dd",
			   endDate: new Date(new Date()),
			   autoclose: true, 
			   startView: "days", 
			   minViewMode: "days"
			}).on('change', function (ev) {
			   $(this).datepicker('hide');
		});
		
		$("#btn_diray1").click(function(){
			$("#sdateStr1").datepicker('show');
		})

		$('#edateStr1').datepicker({
			   format: "yyyy-mm-dd",
			   endDate: new Date(new Date()),
			   autoclose: true, 
			   startView: "days", 
			   minViewMode: "days"
			}).on('change', function (ev) {
			   $(this).datepicker('hide');
		});
		$("#btn_diray2").click(function(){
			$("#edateStr1").datepicker('show');
		})
	})
	
</script>
<div>&nbsp;</div>
<div align="center">
	<h2>회원목록</h2>
</div>
<form action="" method="" id="frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<input type="hidden" name="sdateStr" id="sdateStr" value="${param.sdateStr }" />
<input type="hidden" name="edateStr" id="edateStr" value="${param.edateStr }" />
<input type="hidden" name="kind" id="kind" value="${param.kind }" />
<input type="hidden" name="sch" id="sch" value="${param.sch }" />

<div id="memsch">
	<div class="memschbox1">가입일</div>
	<div class="memschbox2">		
		<input type="text" id="sdateStr1" name="sdateStr" placeholder="검색날짜(시작)" value="${param.sdateStr }" readonly="readonly" />
		<img src="<c:url value="/resources/up/diray.png" />" alt="" id="btn_diray1"/>
		 ~ 
		<input type="text" id="edateStr1" name="edateStr" placeholder="검색날짜(끝)" value="${param.edateStr }" readonly="readonly" />
		<img src="<c:url value="/resources/up/diray.png" />" alt="" id="btn_diray2"/>
		<input type="button" id="allday" name="allday" value="전체"/>
		<input type="button" id="today" name="today" value="오늘"/>
		<input type="button" id="yesterday" name="yesterday" value="어제"/>
		<input type="button" id="beforeWeek" name="beforeWeek" value="1주일"/>
		<input type="button" id="beforemonth" name="beforemonth" value="1개월"/>
	</div>
	<div class="memschbox1">조건검색</div>
	<div class="memschbox2">
		<select id="kind1">
			<option value="pid"<c:if test="${param.kind == 'pid' }">selected="selected"</c:if>>아이디</option>
			<option value="pname"<c:if test="${param.kind == 'pname' }">selected="selected"</c:if>>고객명</option>
			<option value="email"<c:if test="${param.kind == 'email' }">selected="selected"</c:if>>이메일</option>
			<option value="phone"<c:if test="${param.kind == 'phone' }">selected="selected"</c:if>>핸드폰번호</option>
		</select>
		<input type="text" id="sch1" value="${param.sch }"/>
		<input type="button" id="search" value="검색"/>
	</div>

</div>

<div id="memlist" >
	<div id="mmtitle" >
		<div>#</div>
		<div>아이디</div>
		<div>이름</div>
		<div>이메일</div>
		<div>핸드폰번호</div>
		<div>포인트</div>
		<div>가입일</div>
		<div>상세보기</div>
	</div>
	<div id="mmdata">
		<c:forEach var="dto" items="${mainData.list}" varStatus="i">
			 <div>${i.index+1+mainData.pageDTO.start}</div>
			 <div>${dto.pid}</div>
			 <div>${dto.pname}</div>
			 <div>${dto.email}</div>
			 <div>${dto.phone}</div>
			 <div>${dto.point}</div>
			 <div><fmt:formatDate pattern = "yyyy/MM/dd" value="${dto.reg_date}"/></div>
			<div><a href="memberDetail?page=${param.page }&pid=${dto.pid }&sdateStr=${param.sdateStr}
			&edateStr=${param.edateStr}&kind=${param.kind}&sch=${param.sch}">
			<input type="button" value="상세보기"></a></div>
		</c:forEach>
	</div>
	<div class="btnDD">
		<c:if test="${mainData.pageDTO.startPage > 1 }">
			<input type="button" class="btn" dd="${mainData.pageDTO.startPage-1 }" value="&lt" />
		</c:if>
		<c:forEach  begin="${mainData.pageDTO.startPage }" end="${mainData.pageDTO.endPage }" step="1" var="i">
			<% String cc = "btn"; %>
			<c:if test="${mainData.pageDTO.page == i }">
				<% cc += " btnCC"; %>
			</c:if>
			<input type="button" class="<%=cc %>" dd="${i }" value="${i }" />
		</c:forEach>
		
		<c:if test="${mainData.pageDTO.endPage < mainData.pageDTO.total }">
			<input type="button" class="btn" dd="${mainData.pageDTO.endPage+1 }" value="&gt" />
		</c:if>	
	</div>
</div>
</form>