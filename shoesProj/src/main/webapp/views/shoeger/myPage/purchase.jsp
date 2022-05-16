<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script>
   $(function(){
      $(".modify").click(function(){
    	  if(confirm($('.modify').val()+"을 하시겠습니까?\n[사용하신 포인트는 소멸됩니다.]")){
	         $("#productid").val($(this).attr("dd"))
	         $("#kind").val($(this).attr("kk"))
	         $("#state").val($(this).val())
	         frm.action = "modifyRegporder"
	         frm.submit()
    	  }
      })
      $(".btn1").click(function(){
         $("#pageIN").val($(this).attr("dd"))
         frm.action = ""
         frm.submit()
      })
   })
   history.replaceState({}, null, location.pathname);
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="frm" action=""  method="">
<input type="hidden" id="productid" name="productid" value=""   >
<input type="hidden" name="service2" value="${service2 }">
<div class="rbgus">
<h1>구매 목록</h1><br>
<a <c:if test="${param.serch == '전체' || param.serch == null}">style="color: #000"</c:if> class="font" href="purchase?serch=전체">전체</a>&emsp;&emsp;
<a <c:if test="${param.serch == '주문접수'}">style="color: #000"</c:if> class="font" href="purchase?serch=주문접수">주문접수</a>&emsp;&emsp;
<a <c:if test="${param.serch == '배송준비중'}">style="color: #000"</c:if> class="font" href="purchase?serch=배송준비중">준비중</a>&emsp;&emsp;
<a <c:if test="${param.serch == '완료'}">style="color: #000"</c:if> class="font" href="purchase?serch=완료">완료</a>
   <c:forEach items="${clidata.plist }" var="dto" >
      <div class="list12">
         <div>
            <div class="listin"><img src="<c:url value="/resources/up/Thumbnail/${dto.img1 }" />"/></div>
            <div class="listin">
               <h5>배송현황 : ${dto.state }</h5>
               <h5>상품명 : ${dto.kname }</h5>
               <h5>모델명 : ${dto.model }</h5>
               <h5>사이즈 : ${dto.psize }</h5>
               <h5>가격 : ${dto.price }</h5>
               <h5>구매일 : <fmt:formatDate value="${dto.pdate }" pattern="yyyy-MM-dd"/> </h5>
            </div>
            <div class="listin">
            <%Date dd = new Date();
            dd.setDate(dd.getDate()-7);%>
            <script>
               var start = "<%= dd.getTime()%>"
               var end = "${dto.pdate.getTime()}"
               var cens = "${dto.state}"
               if(start <= end && cens=='완료'){
                  document.write("<input type=\"button\" class=\"modify\" dd=\"${dto.productid }\" kk=\"환불\" value=\"환불요청\">")
               }else if(start <= end && (cens=='배송준비중' || cens=='주문접수')){
            	   document.write("<input type=\"button\"  class=\"modify\" dd=\"${dto.productid }\" kk=\"취소\" value=\"취소요청\">")
               }
            </script>
            
            </div>
         </div>
      </div>
   </c:forEach>
<input type="hidden" name="kind" value="" id="kind">
<input type="hidden" name="state" value="" id="state">
<input type="hidden" name="page" id="pageIN" value="${clidata.pageDTO.page }" />
   <div class = "btnDD">
      <c:if test="${clidata.pageDTO.startPage > 1 }">
         <input type="button" class="btn1" dd="${clidata.pageDTO.startPage-1 }" value="&lt" />
      </c:if>
      <c:forEach  begin="${clidata.pageDTO.startPage }" end="${clidata.pageDTO.endPage }" step="1" var="i">
         <% String cc = "btn1"; %>
         <c:if test="${clidata.pageDTO.page == i }">
            <% cc += " btnCC"; %>
         </c:if>
         <input type="button" class="<%=cc %>" dd="${i }" value="${i }" />
      </c:forEach>
      
      <c:if test="${clidata.pageDTO.endPage < clidata.pageDTO.total }">
         <input type="button" class="btn1" dd="${clidata.pageDTO.endPage+1 }" value="&gt" />
      </c:if>   
   </div>
</div>
</form>

</body>
</html>