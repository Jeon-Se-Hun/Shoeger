<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="banner"><img src='<c:url value="/resources/up/banner_1.png"/>' alt="" /></div>
<div class="mainlisttitle">인기상품</div>
<div class="mainlist">
	<c:forEach items="${mainData.get('popular') }" var="item">
		<div class="prodImg">
			
			<div><a href="thatList?model=${item.model }&page=1"><img class="imgg" src='<c:url value="/resources/up/Thumbnail/${item.img1 }"/>' alt="" /></a></div>		
			<div ><img class="brandlogo"  src='<c:url value="/resources/up/brandlogo/${item.brand }_logo.png"/>' /></div>
			<div class="prodename">${item.ename }</div>
			<script>
				value = "${item.rel_price }";
				value = value.split(/(?=(?:...)*$)/);
				value = value.join();
			</script>
			<div class="prodprice">발매가 : <script>document.write(value);</script>  원</div>
			
		</div>
	</c:forEach>
</div>

<div class="banner"><img src='<c:url value="/resources/up/banner_2.png"/>' alt="" /></div>
<div class="mainlisttitle">최근발매 상품</div>
<div class="mainlist">
	<c:forEach items="${mainData.get('new') }" var="item">
		<div id="prodImg">
			<div><a href="thatList?model=${item.model }&page=1"><img class="imgg" src='<c:url value="/resources/up/Thumbnail/${item.img1 }"/>' alt="" /></a></div>
			<div ><img class="brandlogo"  src='<c:url value="/resources/up/brandlogo/${item.brand }_logo.png"/>' /></div>
			<div class="prodename">${item.ename }</div>
			<script>
				value = "${item.rel_price }";
				value = value.split(/(?=(?:...)*$)/);
				value = value.join();
			</script>
			<div class="prodprice">발매가 : <script>document.write(value);</script>  원</div>
		</div>
	</c:forEach>
</div>


<div class="banner"><img src='<c:url value="/resources/up/banner_3.png"/>' alt="" /></div>

<div class="mainlisttitle">최근등록 상품</div>
<div class="mainlist">
	<c:forEach items="${mainData.get('recent') }" var="item">
		<div id="prodImg">
			<div><a href="thatList?model=${item.model }&page=1"><img class="imgg" src='<c:url value="/resources/up/Thumbnail/${item.img1 }"/>' alt="" /></a></div>
			<div ><img class="brandlogo"  src='<c:url value="/resources/up/brandlogo/${item.brand }_logo.png"/>' /></div>
			<div class="prodename">${item.ename }</div>
			<script>
				value = "${item.rel_price }";
				value = value.split(/(?=(?:...)*$)/);
				value = value.join();
			</script>
			<div class="prodprice">발매가 : <script>document.write(value);</script>  원</div>
		</div>
	</c:forEach>
</div>





