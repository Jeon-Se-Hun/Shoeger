<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <div id="outout">
   <div class="outer">
      <div>
         <a href='<c:url value="/shoeger" />'>
            <img id="logo" src='<c:url value="/resources/up/Logo.png"/>' alt="" />
         </a>
      </div>

<script>
$(document).ready(function(){
    $("#search").keypress(function (e) {
       if (e.which == 13){
         var sch = document.getElementById("search").value;
            location.href="/shoeger/shop/shop?page=1&filter=&sch="+sch;
        }
   });
});
 
</script>

      <div>
         <img src='<c:url value="/resources/fff/search.png"/>' id="img"> 
         
            <input type="text" id="search" placeholder="브랜드명, 모델명, 모델번호 등" />
         
      </div>
      <nav>
         <ul>
            <li><a href='<c:url value="/shoeger/shop/shop?brand=&sch=&page=1&filter=" />'> SHOP </a></li>
            <li><a href='<c:url value="/shoeger/member/center/notice/list" />'> 고객센터 </a></li>

            <c:choose>
               <c:when test="${sessionId != null}">
                  <li><a href='<c:url value="/shoeger/member/logout" />'> 로그아웃 </a></li>
                  <li><a href='<c:url value="/shoeger/myPage/myy/main" />'> 마이페이지 </a></li>
               </c:when>
               
               <c:otherwise>
                  <li><a href='<c:url value="/shoeger/member/login" />'> 로그인 </a></li>
               </c:otherwise>
            </c:choose>
            <li><a href='<c:url value="/shoeger/sell/sellrequest" />'> 판매신청 </a></li>
         </ul>
      </nav>   
   </div>
      <div id="whenClick">
         <div class="inner">
            <div class='keyWord'>
               <p id='keyTitle'></p>
            </div>
         </div>
         
         <div class="top_outer">
            <c:forEach items="${schData.get('popular') }" var="item">
               <div class="ccc">
                  <a href="thatList?model=${item.model }" class="top_aTag">
                     <img src='<c:url value="/resources/up/Thumbnail/${item.img1 }"/>' class="mImg"/>
                     <span class="imgText">${item.kname}</span>
                  </a>
               </div>
            </c:forEach>
         </div>
      </div>
   </div>