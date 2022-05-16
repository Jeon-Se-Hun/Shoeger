<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

 <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>

<script src='<c:url value="/resources/my_js/bootstrap-datepicker.min.js"/>' ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>

<script>
	function price(value){
	
	  value = value.split(/(?=(?:...)*$)/)
	  value = value.join(',')
	  if(value == ''){
		  value = '미결정'
	  }else{
		  value = value +'원'
	  }
	  return document.write(value)
	}

	$(function(){
		
		$('#sdate1').datepicker({
			   format: "yyyy-mm-dd",
			   endDate: new Date(new Date()),
			   autoclose: true, 
			   startView: "days", 
			   minViewMode: "days"
			}).on('change', function (ev) {
			   $(this).datepicker('hide');
		});
		
		$("#btn_diray1").click(function(){
			$("#sdate1").datepicker('show');
		})

		$('#edate1').datepicker({
			   format: "yyyy-mm-dd",
			   endDate: new Date(new Date()),
			   autoclose: true, 
			   startView: "days", 
			   minViewMode: "days"
			}).on('change', function (ev) {
			   $(this).datepicker('hide');
		});
		$("#btn_diray2").click(function(){
			$("#edate1").datepicker('show');
		})
		
		
		
		if(${param.sdateStr == null}){
			<%
				Date sd = new Date();
				sd.setDate(sd.getDate()-30);
			%>
			$("#sdate1").val("<%=sdf.format(sd)  %>")
			$("#edate1").val("<%=sdf.format(new Date()) %>")
		}
		
		
		if(${param.state == null}){
			$("#전체").css("background","#ccc")
			$("#state1").val("전체")
			$("#kind1").val("")
			
			
			$("#state").val($("#state1").val())
			$("#sdate").val($("#sdate1").val())
			$("#edate").val($("#edate1").val())
			$("#skind").val($("#skind1").val())
			$("#sch").val($("#sch1").val())
			$("#kind").val($("#kind1").val())
			
			
			frm.submit()
		}else{
			
			$("#${param.kind}${param.state}").css("background","#ccc")
			$("#kind1").val($("#${param.kind}${param.state}").attr("kk"))
		}
		
		$("#today").click(function(){
			$("#sdate1").val("<%=sdf.format(new Date())  %>")
			$("#edate1").val("<%=sdf.format(new Date()) %>")
		})
		$("#yesday").click(function(){
			<%
				sd = new Date();
				sd.setDate(sd.getDate()-1);
			%>
			$("#sdate1").val("<%=sdf.format(sd)  %>")
			$("#edate1").val("<%=sdf.format(new Date()) %>")
		})	
		$("#week").click(function(){
			<%
				sd = new Date();
				sd.setDate(sd.getDate()-7);
			%>
			$("#sdate1").val("<%=sdf.format(sd)  %>")
			$("#edate1").val("<%=sdf.format(new Date()) %>")
		})	
		$("#month").click(function(){
			<%
				sd = new Date();
				sd.setDate(sd.getDate()-30);
			%>
			$("#sdate1").val("<%=sdf.format(sd)  %>")
			$("#edate1").val("<%=sdf.format(new Date()) %>")
		})
		
		$(".btn").click(function(){
			$(".btn").css("background","#fff")
			$(this).css("background","#ccc")
			$("#state1").val($(this).attr("dd"))
			$("#kind1").val($(this).attr("kk"))
		})
		
		$(".detailGo").click(function(){
			$("#tradeid").val($(this).attr("dd"))
			frm.action = "orderDetail"
			frm.submit()
		})
		
		$(".inGo").click(function(){
			var ttid = $(this).attr("dd")
			var state = $("."+ttid).val()
					
			$("#tradeid").val($(this).attr("dd"))
			$("#statebb").val($("#state").val())
			$("#state").val(state)
			frm.action = "orderInReg"
			frm.submit()
		})
		
		$(".btn1").click(function(){
			$("#pageIN").val($(this).attr("dd"))
			frm.submit()
		})
		
		$("#result").click(function(){
			$("#pageIN").val("1")
			$("#state").val($("#state1").val())
			$("#sdate").val($("#sdate1").val())
			$("#edate").val($("#edate1").val())
			$("#skind").val($("#skind1").val())
			$("#sch").val($("#sch1").val())
			$("#kind").val($("#kind1").val())
			
			frm.submit()
		})
	})
</script>
<form action="" id="frm">
<input type="hidden" name="page" id="pageIN" value="${mainData.pageDTO.page }" />
<input type="hidden" name="tradeid" id="tradeid" value="" />
<input type="hidden" name="service" id="service" value="${csData.service }" />
<input type="hidden" name="statebb" id="statebb" />


<input type="hidden" name="state" id="state" value="${param.state }"/>
<input type="hidden" name="sdateStr" id="sdate" value="${param.sdateStr }"/>
<input type="hidden" name="edateStr" id="edate" value="${param.edateStr }"/>
<input type="hidden" name="skind" id="skind" value="${param.skind }"/>
<input type="hidden" name="sch" id="sch" value="${param.sch }"/>
<input type="hidden" id="kind" name="kind" value="${param.kind }"/>



<input type="hidden" id="kind1"/>

	<div id="table1">
		<h3>주문 목록</h3>
		<div>진행상태</div>
		<div>
			<input type="hidden" id="state1" value="${param.state }"/>
			<input type="button" class="btn" id="전체" kk="" name="전체" value="전체" dd="전체"/>
			<input type="button" class="btn" id="매입미수령" kk="매입" value="미수령" dd="미수령"/>
			<input type="button" class="btn" id="매입수령" kk="매입" value="수령" dd="수령"/>
			<input type="button" class="btn" id="매입검수중" kk="매입" value="검수중" dd="검수중"/>
			<input type="button" class="btn" id="매출주문접수" kk="매출" value="주문접수" dd="주문접수"/>
			<input type="button" class="btn" id="매출배송준비중" kk="매출" value="배송준비중" dd="배송준비중"/>
			<input type="button" class="btn" id="매출완료" kk="매출" value="배송완료" dd="완료"/>
			<input type="button" class="btn" id="취소취소요청" kk="취소" value="취소요청" dd="취소요청"/>
			<input type="button" class="btn" id="취소환불요청" kk="환불" value="환불요청" dd="환불요청"/>
		</div>
		<div>기간</div>
		<div>
			<input type="text" id="sdate1" value="${param.sdateStr }" readonly="readonly" />
			<img src="<c:url value="/resources/up/diray.png" />" alt="" id="btn_diray1"/>
			 ~ 
			<input type="text" id="edate1" value="${param.edateStr }" readonly="readonly" />
			<img src="<c:url value="/resources/up/diray.png" />" alt="" id="btn_diray2"/>
			<input type="button" id="today" name="today" value="오늘" />
			<input type="button" id="yesday" name="yesday" value="어제" />
			<input type="button" id="week" name="week" value="1주일" />
			<input type="button" id="month" name="month" value="1개월" />
		</div>
		<div>조건검색</div>
		<div>
			<select id="skind1">
				<option value="pid" <c:if test="${param.skind == 'pid' }">selected="selected"</c:if>>주문자 id</option>
				<option value="tradeid" <c:if test="${param.skind == 'tradeid' }">selected="selected"</c:if>>거래 번호</option>
			</select>
			<input type="text" id="sch1" value="${param.sch }">
			<input type="button" value="검색" id="result">
		</div>
		
	</div>

<div id="table2" >
	<div id="title">
		<div><input type="checkbox" ></div>
		<div>주문일</div>
		<div>거래 번호</div>
		<div>주문자 ID</div>
		<div>주문 금액</div>
		<div>주문 상태</div>
		<div>상세보기</div>
	</div>
	<div id="date">
		<c:forEach items="${mainData.list }" var="dto">
			<div><input type="checkbox" ></div>
			<div><fmt:formatDate value="${dto.pdate }" pattern="yyyy-MM-dd HH:mm" /></div>
			<div>${dto.tradeid }</div>
			<div>${dto.pid }</div>
			<div><script>price("${dto.price }")</script></div>
			<div>
				<c:if test="${dto.kind == '매입' }">
					<c:choose>
						<c:when test="${dto.state == '완료' or dto.state == '취소' }">
							<input type="text" value="검수${dto.state }" readonly="readonly"/>
						</c:when>
						<c:when test="${dto.state == '검수중'}">
							<input type="text" value="${dto.state }" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<select class="${dto.tradeid }">
								<option value="미수령" <c:if test="${dto.state == '미수령' }">selected="selected"</c:if>>미수령</option>
								<option value="수령" <c:if test="${dto.state == '수령' }">selected="selected"</c:if>>수령</option>
								<option value="검수중" <c:if test="${dto.state == '검수중' }">selected="selected"</c:if>>검수중</option>
							</select>
							<input type="button" class="inGo" dd="${dto.tradeid }" value="적용">
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${dto.kind == '매출' }">
					<c:choose>
						<c:when test="${dto.state == '완료'}">
							<input type="text" value="배송${dto.state }" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<select class="${dto.tradeid }">
								<option value="주문접수" <c:if test="${dto.state == '주문접수' }">selected="selected"</c:if>>주문접수</option>
								<option value="배송준비중" <c:if test="${dto.state == '배송준비중' }">selected="selected"</c:if>>배송준비중</option>		
								<option value="완료" <c:if test="${dto.state == '완료' }">selected="selected"</c:if>>배송완료</option>		
							</select>
							<input type="button" class="inGo" dd="${dto.tradeid }" value="적용">
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${dto.kind == '취소' }">
					<c:choose>
						<c:when test="${dto.state == '완료'}">
							<input type="text" value="취소${dto.state }" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<select class="${dto.tradeid }">
								<option value="취소요청" <c:if test="${dto.state == '취소요청' }">selected="selected"</c:if>>취소요청</option>
								<option value="완료" <c:if test="${dto.state == '완료' }">selected="selected"</c:if>>취소완료</option>		
							</select>
							<input type="button" class="inGo" dd="${dto.tradeid }" value="적용">
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${dto.kind == '환불' }">
					<c:choose>
						<c:when test="${dto.state == '완료'}">
							<input type="text" value="환불${dto.state }" readonly="readonly"/>
						</c:when>
						<c:otherwise>
							<select class="${dto.tradeid }">
								<option value="환불요청" <c:if test="${dto.state == '환불요청' }">selected="selected"</c:if>>환불요청</option>
								<option value="완료" <c:if test="${dto.state == '완료' }">selected="selected"</c:if>>환불완료</option>		
							</select>
							<input type="button" class="inGo" dd="${dto.tradeid }" value="적용">
						</c:otherwise>
					</c:choose>
				</c:if>
			</div>
			<div>
				<input type="button" class="detailGo" dd="${dto.tradeid }" value="상세보기">
			</div>
		</c:forEach>
	</div>
	<div class = "btnDD">
		<c:if test="${mainData.pageDTO.startPage > 1 }">
			<input type="button" class="btn1" dd="${mainData.pageDTO.startPage-1 }" value="&lt" />
		</c:if>
		<c:forEach  begin="${mainData.pageDTO.startPage }" end="${mainData.pageDTO.endPage }" step="1" var="i">
			<% String cc = "btn1"; %>
			<c:if test="${mainData.pageDTO.page == i }">
				<% cc += " btnCC"; %>
			</c:if>
			<input type="button" class="<%=cc %>" dd="${i }" value="${i }" />
		</c:forEach>
		
		<c:if test="${mainData.pageDTO.endPage < mainData.pageDTO.total }">
			<input type="button" class="btn1" dd="${mainData.pageDTO.endPage+1 }" value="&gt" />
		</c:if>	
	</div>
</div>
</form>


