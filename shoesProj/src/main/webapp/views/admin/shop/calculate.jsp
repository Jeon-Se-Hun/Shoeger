<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy");
%>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

 <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
<script src='<c:url value="/resources/my_js/bootstrap-datepicker.min.js"/>' ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>

<script>
	function price(value){
		 value = value.split(/(?=(?:...)*$)/)
	    value = value.join(',')
	    return document.write(value)
	}
	$(document).ready(function() {
		if(${param.skind == 'mm'}){
			$('#sdate').datepicker({
				   format: "yyyy",
				   endDate: new Date(new Date()),
				   autoclose: true, 
				   startView: "years", 
				   minViewMode: "years"
				}).on('change', function (ev) {
				   $(this).datepicker('hide');
			});
			
		}else if(${param.skind == 'yy'}){

			$('#sdate').datepicker({
				   format: "yyyy",
				   endDate: new Date(new Date()),
				   autoclose: true, 
				   startView: "years", 
				   minViewMode: "years"
				}).on('change', function (ev) {
				   $(this).datepicker('hide');
			});
			
			$('#edate').datepicker({
				   format: "yyyy",
				   endDate: new Date(new Date()),
				   autoclose: true, 
				   startView: "years", 
				   minViewMode: "years"
				}).on('change', function (ev) {
				   $(this).datepicker('hide');
			});
			
		}else if(${param.skind == 'dd'}){
			
			$('#sdate').datepicker({
			    format: "yyyy-mm",
			    endDate: new Date(new Date()),
			    autoclose: true, 
			   startView: "months", 
			   minViewMode: "months",
			}).on('change', function (ev) {
			   $(this).datepicker('hide');
			});
			
			
			
		}else if(${param.skind == 'hh' or param.skind == '' or param.skind == null } ){
			$('#sdate').datepicker({
				   format: "yyyy-mm-dd",
				   endDate: new Date(new Date()),
				   autoclose: true, 
				   startView: "days", 
				   minViewMode: "days"
				}).on('change', function (ev) {
				   $(this).datepicker('hide');
			});
			
		}
		
		$("#btn_diray1").click(function(){
			$("#sdate").datepicker('show');
		})
		
		$("#btn_diray2").click(function(){
			$("#edate").datepicker('show');
		})
		
	
	});
</script>

<script>
	$(function(){


		
		if(${param.sdateStr == null}){
			$("#sdate").val("<%=sdf.format(new Date())%>")
			$("#edate").val("<%=sdf.format(new Date())%>")
		}
		$("#result").click(function(){	
			if($("#skind").val() != 'yy'	){
				$("#edate").val($("#sdate").val())
			}
			frm.submit()
		})
		$("#skind").change(function(){
			if($(this).val() == 'dd'){
				$("#sdate").val("<%=sdf1.format(new Date())%>")
				$("#edate").val("<%=sdf1.format(new Date())%>")
			}else if($(this).val() == 'mm'){
				$("#sdate").val("<%=sdf2.format(new Date())%>")
				$("#edate").val("<%=sdf2.format(new Date())%>")
			}else if($(this).val() == 'yy'){
				<%Date sd = new Date();
				sd.setYear(sd.getYear() - 10);%>
				$("#sdate").val("<%=sdf2.format(sd)%>")
				$("#edate").val("<%=sdf2.format(new Date())%>")
			}else{
				$("#sdate").val("<%=sdf.format(new Date())%>")
				$("#edate").val("<%=sdf.format(new Date())%>")
			}
			
			frm.submit()
		})
		
		if(${param.skind == null}){
			frm.submit()
		}
	})
</script>

<form action="" id="frm">

	<div id="calculate">
		<div id="table1">
		<h3>정산</h3>
			<div>기간</div>
			<div>
				<select name="skind" id="skind">
					<option value="hh" <c:if test="${param.skind == 'hh' }">selected="selected"</c:if>>시간별</option>
					<option value="dd" <c:if test="${param.skind == 'dd' }">selected="selected"</c:if>>일별</option>
					<option value="mm" <c:if test="${param.skind == 'mm' }">selected="selected"</c:if>>월별</option>
					<option value="yy" <c:if test="${param.skind == 'yy' }">selected="selected"</c:if>>년별</option>
				</select>
				<input type="text" id="sdate" name="sdateStr" value="${param.sdateStr }" readonly="true" /> 
				<img src="<c:url value="/resources/up/diray.png" />" alt="" id="btn_diray1"/>
	
				<c:if test="${param.skind == 'yy'}">
					 ~ 
					<input type="text" id="edate" name="edateStr" value="${param.edateStr }" readonly="true" />
					<img src="<c:url value="/resources/up/diray.png" />" alt="" id="btn_diray2"/>
				</c:if>
				<c:if test="${param.skind != 'yy'}">
					<input type="hidden" id="edate" name="edateStr" value="${param.edateStr }"/>
				</c:if>
				<input type="button" value="검색" id="result">
			</div>
		</div>

		<div id="table2">
			<table>
				<tr>
					<td colspan="2">매출</td>
					<td colspan="2">매입</td>
					<td colspan="2">이익</td>
				</tr>
				<tr>
					<td>건수</td>
					<td>금액</td>
					<td>건수</td>
					<td>금액</td>
					<td colspan="2">금액</td>
				</tr>
				<tr>
					<td>${mainData.salsCnt.cnt }</td>
					<td><script>price("${mainData.salsCnt.tot }")</script>원</td>
					<td>${mainData.purCnt.cnt }</td>
					<td><script>price("${mainData.purCnt.tot }")</script>원</td>
					<td colspan="2"><script>price("${mainData.salsCnt.tot - mainData.purCnt.tot -mainData.cancelCnt.tot}")</script>원</td>
				</tr>
			</table>

		</div>

		<canvas id="chart" width="1000" height="300"></canvas>
		<div>
			<script>

			
			var ctx = document.getElementById('chart').getContext('2d');
			var chart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: ${mainData.label},
					datasets: [{
						label: '매출',
						backgroundColor: 'rgba(0, 0, 255,0)',
						borderColor: 'rgb(170, 170, 255)',
						data: ${mainData.ssdata}
					},{
						label: '매입',
						backgroundColor: 'rgba(0, 255, 0, 0)',
						borderColor: 'rgb(170, 255, 170)',
						data: ${mainData.ppdata}
					},{
						label: '이익',
						
						backgroundColor: 'rgba(255, 0, 0, 0)',
						borderColor: 'rgb(255, 170, 170)',
						data: ${mainData.ccdata}
					}]
				},
				options: {
					responsive: false,
					scales: {
						yAxes: [{
							ticks: {
								beginAtZero: true,
		                        userCallback: function(value, index, values) {
		                            value = value.toString();
		                            value = value.split(/(?=(?:...)*$)/);
		                            value = value.join(',');
		                            return value;
		                        }
							}
						
						}]
					},

				},
				
			});
		</script>
		</div>
	</div>
	
</form>

