<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<script>
	$(function(){
		$(".bankModify").click(function(){
			
			
			if($(this).val() == "수정"){
				$(this).val("확인")
				
				$(".bankModify").each(function(){
					$(this).attr("disabled", true)
				})
				$(".bankDel").each(function(){
					$(this).attr("disabled", true)
				})
				$(this).attr("disabled", false)
				
				if($(this).attr("frm") == 'frm1'){
					$("#bank"+$(this).attr("mm")+" > input").prop("type","text")
					$("#bank"+$(this).attr("mm")+" > input").val($("#bank"+$(this).attr("mm")+"> div").text())
					$("#bank"+$(this).attr("mm")+" > input").attr("name","bname")
					$("#bank"+$(this).attr("mm")+" > div").text("")
					$("#bank"+$(this).attr("mm")+" > div").hide()
					
					$("#bankNum"+$(this).attr("mm")+" > input").prop("type","text")
					$("#bankNum"+$(this).attr("mm")+" > input").val($("#bankNum"+$(this).attr("mm")+"> div").text())
					$("#bankNum"+$(this).attr("mm")+" > input").attr("name","pnum")
					$("#bankNum"+$(this).attr("mm")+" > div").text("")
					$("#bankNum"+$(this).attr("mm")+" > div").hide()
					
					$("#bankPname"+$(this).attr("mm")+" > input").prop("type","text")
					$("#bankPname"+$(this).attr("mm")+" > input").val($("#bankPname"+$(this).attr("mm")+"> div").text())
					$("#bankPname"+$(this).attr("mm")+" > input").attr("name","pname")
					$("#bankPname"+$(this).attr("mm")+" > div").text("")
					$("#bankPname"+$(this).attr("mm")+" > div").hide()			
				}else{
					$("#ttName"+$(this).attr("mm")+" > input").prop("type","text")
					$("#ttName"+$(this).attr("mm")+" > input").val($("#ttName"+$(this).attr("mm")+"> div").text())
					$("#ttName"+$(this).attr("mm")+" > input").attr("name","bname")
					$("#ttName"+$(this).attr("mm")+" > div").text("")
					$("#ttName"+$(this).attr("mm")+" > div").hide()
					
					$("#ttUrl"+$(this).attr("mm")+" > input").prop("type","text")
					$("#ttUrl"+$(this).attr("mm")+" > input").val($("#ttUrl"+$(this).attr("mm")+"> div").text())
					$("#ttUrl"+$(this).attr("mm")+" > input").attr("name","pnum")
					$("#ttUrl"+$(this).attr("mm")+" > div").text("")
					$("#ttUrl"+$(this).attr("mm")+" > div").hide()
				}

			}else{
				if($(this).attr("frm") == 'frm1'){
					$("#pid1").val($(this).attr("mm"))
					frm1.submit($(this).attr("mm"))
				}else{
					$("#pid2").val($(this).attr("mm"))
					frm2.submit($(this).attr("mm"))
				}
			}
		})
		
		$(".bankDel").click(function(){
			if($(this).attr("frm") == 'frm1'){
				if(confirm("정말 삭제하시겠습니까?") == 1){
					$("#pid1").val($(this).attr("mm"))
					frm1.submit($(this).attr("mm"))
				}
			}else{
				if(confirm("정말 삭제하시겠습니까?") == 1){
					$("#pid2").val($(this).attr("mm"))
					frm2.submit($(this).attr("mm"))
				}
			}
		})
	})
</script>

<div id="opertion">
	<h3>운영정보</h3>
	<h4>결제정보</h4>
	
	
<form action="${csData.service }Reg" id="frm1">
	<input type="hidden" name="kind" value="계좌"/>
	<input type="hidden" name="pid" id="pid1"/>
	<div class="table">
		<div>은행계좌번호</div>
		<div>
			<div class="intable">
				<div>은행명</div>
				<div>계좌번호</div>
				<div>예금주</div>
				<div>수정/삭제</div>
				<c:forEach items="${mainData.operList1 }" var="dto" varStatus="no" >
					<div id = "bank${no.index+1 }">
						<div>${dto.bname }</div>
						<input type="hidden" />
					</div>
					<div id = "bankNum${no.index+1 }">
						<div>${dto.pnum }</div>
						<input type="hidden" />
					</div>
					<div id = "bankPname${no.index+1 }">
						<div>${dto.pname }</div>
						<input type="hidden" />
					</div>
					<div>
						<input class = "bankModify" mm="${no.index+1 }" frm="frm1" type="button" value="수정"/> /
						<input class = "bankDel" mm="${no.index+1 }" frm="frm1" type="button" value="삭제"/>
					</div>
				
				</c:forEach>
			
			</div>
			<!-- <input class="" type="button" value="추가"/> -->
		</div>
	</div>
</form>
<form action="${csData.service }Reg" id="frm2">
	<input type="hidden" name="kind" value="배송"/>
	<input type="hidden" name="pid" id="pid2"/>
	<br><br>
	<h4>배송정보</h4>
	<div class="table">
		<div>배송사</div>
		<div> 
			<div class="intable1">
				<div>택배사</div>
				<div>배송추적URL</div>
				<div>수정/삭제</div>
				
				<c:forEach items="${mainData.operList2 }" var="dto" varStatus="no" >
					<div id = "ttName${no.index+1 }">
						<div>${dto.bname }</div>
						<input type="hidden" />
					</div>
					<div id = "ttUrl${no.index+1 }">
						<div>${dto.pnum }</div>
						<input type="hidden" />
					</div>
					<div>
						<input class = "bankModify" mm="${no.index+1 }" frm="frm2" type="button" value="수정"/> /
						<input class = "bankDel" mm="${no.index+1 }" frm="frm2" type="button" value="삭제"/>
					</div>
				
				</c:forEach>
			</div>
			
			<!-- <input type="button" value="추가"/> -->
		</div>
	
	</div>

</form>

</div>




