	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	function price(value){
		 value = value.split(/(?=(?:...)*$)/)
         value = value.join(',')
         return document.write(value)
	}
	
	
	$(function(){
		$("#calcul").click(function(){
			location.href="../order/orderList"
		})
		$("#ssState table").click(function(){
			location.href="../shop/calculate"
		})
		$("#memState > div:nth-of-type(1) > table").click(function(){
			location.href="../member/memberList"
		})
		$("#memState > div:nth-of-type(2) > table").click(function(){
			location.href="../member/memberVisit"
		})
		$("#senState").click(function(){
			location.href="../board/qna"
		})
		
		
	})
	
	
</script>
<div id="total">
	<br>
	<h3>상점 현황</h3>
	<div id="ssState">
		<div id = "calcul">
			<div><div>미수령</div><div>${mainData.ssDTO.porder }건</div></div>
			<div><div>수령</div><div>${mainData.ssDTO.inspection }건</div></div>
			<div><div>검수중</div><div>${mainData.ssDTO.payComplete }건</div></div>
			<div><div>주문접수</div><div>${mainData.ssDTO.transProcess }건</div></div>
			<div><div>배송준비중</div><div>${mainData.ssDTO.transIng }건</div></div>
			<div><div>배송완료</div><div>${mainData.ssDTO.transComplete }건</div></div>
			<div><div>환불요청</div><div>${mainData.ssDTO.can }건</div></div>
			<div><div>환불완료</div><div>${mainData.ssDTO.canComplete }건</div></div>
		</div>
		<div>
			<table id="table1">
				<tr>
					<td><div>오늘 매출액 :</div><div><script>price("${mainData.ssTot.ddTot }")</script>원</div></td>
					<td><div>이번주 매출액 :</div><div><script>price("${mainData.ssTot.wwTot }")</script>원</div></td>
				</tr>
				<tr>
					<td><div>이번달 매출액 :</div><div><script>price("${mainData.ssTot.mmTot }")</script>원</div></td>
					<td><div>올해 매출액 :</div><div><script>price("${mainData.ssTot.yyTot }")</script>원</div></td>
				</tr>
			</table>
		</div>
	</div>
	<br><hr>
	<div id="memState">
	<br>
		<h3>회원 현황</h3>
		<div>
			<table id="table1">
				<tr>
					<td><div>오늘 가입 수 :</div><div>${mainData.ccTot.ddTot }명</div></td>
					<td><div>이달 가입 수 :</div><div>${mainData.ccTot.mmTot }명</div></td>
				</tr>
				<tr>
					<td><div>올해 가입 수 :</div><div>${mainData.ccTot.yyTot }명</div></td>
					<td><div>전체 회원 :</div><div>${mainData.ccTot.wwTot }명</div></td>
				</tr>
			</table>
		</div>
		<br>
		<br><hr><br>
		<h3>방문자 현황</h3>
		<div>
			<table id="table1">
				<tr>
					<td><div>오늘 방문자 :</div><div>${mainData.vvTot.ddTot }명</div></td>
					<td><div>이번 주 방문자 :</div><div>${mainData.vvTot.wwTot }명</div></td>
				</tr>
				<tr>
					<td><div>이달 방문자 :</div><div>${mainData.vvTot.mmTot }명</div></td>
					<td><div>올해 방문자 :</div><div>${mainData.vvTot.yyTot }명</div></td>
				</tr>
			</table>
		</div>
	</div>
	<br>
	<div id="senState">
		<h3>QnA</h3>
		
		<div>
			<div>제목</div>
			<div>이름</div>
			<div>날짜</div>
			
			<c:forEach items="${mainData.bbList }" var="dto">
			
				<div class="qnabtn" dd="${dto.id }">${dto.title }</div>
				<div>${dto.pid }</div>
				<div><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-ss"/> </div>
			
			</c:forEach>
		</div>
	</div>
	
</div>
