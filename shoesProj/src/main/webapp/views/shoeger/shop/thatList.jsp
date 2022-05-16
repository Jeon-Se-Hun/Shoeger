<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<script>



$(function(){
    $(".btnn").click(function(){

       $("#pageIN").val($(this).attr("dd"))
       ffm.submit()
    })
 })
 
var pageBtn = document.getElementsByClassName("btnn");
 
$(function pageClick(event){
    for(i = 0; i< pageBtn.length; i++){
       if(pageBtn[i].value==${param.page}){
          pageBtn[i].style.color = "black";
       }
    }
})
 
</script>

<form action="" name="ffm">
<input type="hidden" name="model" id="model" value="${param.model }"/>
<input type="hidden" name="page" id="pageIN" value="${param.pageIN }"/>


<script>
function gradeAppear(getgrade){
   var grades = document.getElementsByClassName("ggrade");
   
   
   for(var i in grades){
      if(grades[i].innerHTML == getgrade){
         getgrade="C";
         grades[i].style.border = "3px solid #f00";
         grades[i].style.color = "#000";
      }
   }
}
</script>
<div id = "out_hy">
<c:forEach items="${mainData.sDTO }" var="item">
   <div class="usedlist">   
      <div><a href="prodDetail?model=${item.model }&productid=${item.productid}&page=${param.page}"><img class="usedimg" src='<c:url value="/resources/up/used/${item.img1 }"/>' alt="" /></a></div>
      <div class="th">
         <div id="ect">등급</div>         
         <div <c:if test="${item.grade == 'S' }">class="ggrade"</c:if>>S</div>
         <div <c:if test="${item.grade == 'A' }">class="ggrade"</c:if>>A</div>
         <div <c:if test="${item.grade == 'B' }">class="ggrade"</c:if>>B</div>
         
      </div>
      <div class="th">
         <div>Size</div>
         <div>${item.psize }</div>
      </div>
      <div class="th">
         <div>가격</div>
         <script>
            value = "${item.sprice }";
            value = value.split(/(?=(?:...)*$)/);
            value = value.join();
         </script>
         <div><script>document.write(value);</script>원</div>
      </div>
      
   </div>
</c:forEach>
</div>
   <div id = "pgbtn">
      <c:if test="${mainData.spDTO.startPage > 1 }">
         <input type="button" class="btnn" dd="${mainData.spDTO.startPage-1 }"
            value="&lt" />
      </c:if>
      <c:forEach begin="${mainData.spDTO.startPage }"   end="${mainData.spDTO.endPage }" step="1" var="i">
         
               <input type="button" class="btnn" dd="${i }" value="${i }" />
         
         
      </c:forEach>
      <c:if test="${mainData.spDTO.endPage < mainData.spDTO.total }">
         <input type="button" class="btnn" dd="${mainData.spDTO.endPage+1 }"
            value="&gt" />
      </c:if>
   </div>
</form>
</body>
</html>