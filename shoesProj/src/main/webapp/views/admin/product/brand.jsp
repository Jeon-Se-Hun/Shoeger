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
		
		$("#brandinsert").click(function(){
			frm.action = "brandInsert"
			frm.submit()
		})
		
		$(".modi").click(function(){
			$("#id").val($(this).attr("mm"))
			frm.action = "brandModify"
			frm.submit()
		})
		
		$(".delel").click(function(){
			if(confirm("정말 삭제하시겠습니까?") == 1){
				location.href="brandDeReg?id="+$(this).attr("mm") + "&img1=" + $('#delImg').val()			
			}
		})

		$(".btn").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
		$("#result").click(function(){
			$("#pageIN").val("1")
			$("#sch").val($("#sch1").val())
			frm.submit()
		})
		
	})
	
	
</script>
<form action="" id="frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<input type="hidden" name="id" id="id" value="" />
<input type="hidden" value="${param.sch}" name="sch" id="sch"/>

	<div id="table1">
		
		<br>
		<h3>브랜드 목록</h3>
		<br>
		<div>
			조건검색
		</div>
		<div>
			<div>
				<input type="text" id="sch1" value="${param.sch }" />
				<input type="button" value="검색" id="result"/>
			</div>
		</div>
	</div>
</form>

<div id="table2" >
	<div><input type="button" value="브랜드 등록" id="brandinsert" /></div>
	<div id="title">
		<div>id</div>
		<div>상품명(eng)</div>
		<div>상품명(kr)</div>
		<div>출력용 상품명</div>
		<div>수정/삭제</div>
	</div>
	<div id="date">
		<c:forEach items="${mainData.list }" var="bb">
			<div>${bb.id }</div>
			<div>${bb.ename }</div>
			<div>${bb.kname }</div>
			<div>${bb.brandprint }</div>
			<div>
				<input class="modi" type="button" value="수정" mm="${bb.id }"> / 
				<input class="delel" type="button" value="삭제" mm="${bb.id }">
				<input type="hidden" value="" id="delImg">
			</div>
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


