<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function price(value){
		 value = value.split(/(?=(?:...)*$)/)
	  value = value.join(',')
	  return document.write(value)
	}

	$(function(){
		if($("#brand").val() == ''){
			$("#brand").val("전체") 
		}

		$(".btn").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
		$("#result").click(function(){
			$("#pageIN").val("1")
			$("#brand").val($("#brand1").val())
			$("#skind").val($("#skind1").val())
			$("#sch").val($("#sch1").val())
			frm.submit()
		})
		
		
		
		
	})
	
	
</script>
<form action="" id="frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<input type="hidden" value="${param.brand}" name="brand" id="brand"/>
<input type="hidden" value="${param.skind}" name="skind" id="skind"/>
<input type="hidden" value="${param.sch}" name="sch" id="sch"/>

	<div id="table1">
		<br>
		<h3>상품 판매 현황</h3>
		<br>
		<div>조건검색</div>
		<div>
			<div>
				<select id="brand1">
					<option value ="전체">브랜드 선택(전체)</option>
					<c:forEach items="${mainData.brand }" var="bb">
						<option value="${bb }" <c:if test="${param.brand == bb }">selected="selected"</c:if>>${bb }</option>
					</c:forEach>
				</select>
				<select id="skind1">
					<option value="model" <c:if test="${param.skind == 'model' }">selected="selected"</c:if>>모델 번호</option>
					<option value="kname" <c:if test="${param.skind == 'kname' }">selected="selected"</c:if>>상품명</option>
				</select>
				<input type="text" id="sch1" value="${param.sch }" />
				<input type="button" value="검색" id="result"/>
			
			</div>
		</div>
	</div>
</form>
<br>
<br>
<div id="table2" >
	<div id="title">
		<div>상품 번호</div>
		<div>상품명</div>
		<div>모델 번호</div>
		<div>브랜드</div>
		<div>가격</div>
		<div>판매자</div>
	</div>
	<div id="date">
		<c:forEach items="${mainData.list }" var="pp">
			<div>${pp.productid }</div>
			<div>${pp.kname }</div>
			<div>${pp.model }</div>
			<div>${pp.brand }</div>
			<div><script>price("${pp.sprice }")</script>원</div>
			<div>${pp.pid.split("@")[0] }</div>
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