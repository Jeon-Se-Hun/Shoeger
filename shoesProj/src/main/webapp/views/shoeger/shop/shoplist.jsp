<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>


</style>
</head>
<script>
$(function(){
    $(".btn").click(function(){

       $("#pageIN").val($(this).attr("dd"))
       frm.submit()
    })
 })
 
var pageBtn = document.getElementsByClassName("btn");
 
$(function pageClick(event){
	 for(i = 0; i< pageBtn.length; i++){
	 console.log(pageBtn[i].value);
		 if(pageBtn[i].value==${param.page}){
			 pageBtn[i].style.color = "black";
		 }
	 }
})
 
</script>
<body>
	<form action="" name="frm">
	<input type="hidden" name="filter" value="${param.filter }"/>
	<input type="hidden" name="brand" value="${param.brand }"/>
	<input type="hidden" name="page" id="pageIN" value="${param.pageIN }"/>
	<input type="hidden" name="sch" value="${param.sch }" />
	
		<div class="shoplist">
			<div id="filter">
				<a href="shop?brand=${param.brand }&page=1&filter=popular&sch=${param.sch}">인기순</a> / 
				<a	href="shop?brand=${param.brand }&page=1&filter=reg_date&sch=${param.sch}">등록일순</a> / 
				<a	href="shop?brand=${param.brand }&page=1&filter=rel_date&sch=${param.sch}">발매일순</a>
			</div>
			<c:forEach items="${mainData.searchres }" var="item">
				<div class="prodImg1">
					<div id="imgdiv">
						<a href="thatList?model=${item.model }&page=1"><img	src='<c:url value="/resources/up/Thumbnail/${item.img1 }"/>' alt="" /></a>
					</div>
					<div ><img class="dbrandlogo"  src='<c:url value="/resources/up/brandlogo/${item.brand }_logo.png"/>' /></div>
					<div class="prodename1">${item.ename }</div>
					<script>
						value = "${item.rel_price }";
						value = value.split(/(?=(?:...)*$)/);
						value = value.join();
					</script>
					<div class="prodprice1"><script>document.write(value);</script>원</div>
				</div>
			</c:forEach>



			
		</div>
			<div id = "pagebtns">
			<c:if test="${mainData.spDTO.startPage > 1 }">
				<input type="button" class="btn" dd="${mainData.spDTO.startPage-1 }"
					value="&lt" />
			</c:if>
			<c:forEach begin="${mainData.spDTO.startPage }"	end="${mainData.spDTO.endPage }" step="1" var="i">
				
						<input type="button" class="btn" dd="${i }" value="${i }" />
				
				
			</c:forEach>
			<c:if test="${mainData.spDTO.endPage < mainData.spDTO.total }">
				<input type="button" class="btn" dd="${mainData.spDTO.endPage+1 }"
					value="&gt" />
			</c:if>
			</div>
	</form>
</body>
</html>