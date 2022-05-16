<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
 <link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css"/>'>
<script src='<c:url value="/resources/my_js/bootstrap-datepicker.min.js"/>' ></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet"/>   

<script>
	$(function(){
		
		$("#brandlist").change(function(){
			var vv = $(this).val()
			if(vv=='브랜드 선택'){
				$("#brand").val("")
			}else{
				$("#brand").val(vv)
			}
		})
		
		$("#insert").click(function(){
			var kname = $("#kname").val()
			var ename = $("#ename").val()
			var model = $("#model").val()
			var brand = $("#brand").val()
			var rel_price = $("#rel_price").val()
			if(kname == "" || ename == "" || model == "" || brand == "" || rel_price == ""){
				alert("모든항목을 입력해주세요")
			}else{
				frm.submit();							
			}
		})
		
		$("#back").click(function(){
			frm.action = "productList"
			$("#brand").val("${param.brand}")
			frm.submit();
		})
		
		$("#delete").click(function(){
			if(confirm("정말 삭제하시겠습니까?") == 1){
				frm.action = "productDeReg";
				frm.submit();
			}
		})
		
		$('#rel_dateStr').datepicker({
		   format: "yyyy-mm-dd",
		   endDate: new Date(new Date()),
		   autoclose: true, 
		   startView: "days", 
		   minViewMode: "days"
		}).on('change', function (ev) {
		   $(this).datepicker('hide');
		});
		
		$("#btn_diray1").click(function(){
			$("#rel_dateStr").datepicker('show');
		})
		
		$("#rel_price").on("propertychange change keyup paste input", function() {
	      var regexp = /[^0-9]/gi
	      $(this).val($(this).val().replace(regexp,''));
   		})
		
	})
	
		function readURL(input) {
         if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
               $('#blah').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
         }
      }
</script>

<form action="productMoReg" method="post" enctype="Multipart/form-data" id="frm">
<input type="hidden" name="page" id="pageIN" value="${param.page }" />
<input type="hidden" name="skind" id="pageIN" value="${param.skind }" />
<input type="hidden" name="sch" id="pageIN" value="${param.sch }" />
<input type="hidden" name="img1" value="${mainData.ppDTO.img1}">
	<div id = table1>
		<br>
		<h3>상품수정</h3>
		<div>
			<div class="tttt">상품명</div>
			
			<div id="pppp">
				<div>
					<input type="text" name="kname" class="productName" value="${mainData.ppDTO.kname }" placeholder="(kor)" />
				</div>
				<hr />
				<div>
					<input type="text" name="ename" class="productName" value="${mainData.ppDTO.ename }" placeholder="(eng)" />
				</div>
			</div>
			
			<div class="tttt">브랜드</div>
			<div>
				<input type="text" id="brand" name = "brand" value="${mainData.ppDTO.brand }" readonly="readonly"/>
				<select id="brandlist">
					<option>브랜드 선택</option>
					<c:forEach items="${mainData.brand }" var="bb">
						<option value="${bb }" <c:if test="${mainData.ppDTO.brand == bb }">selected="selected"</c:if>>${bb }</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="tttt">모델 번호</div>
			<div>
				<input type="text" name="model" id="model" value="${mainData.ppDTO.model }" readonly="readonly" />
			</div>
			
			<div class="tttt">가격</div>
			<div>
				<input type="text" name="rel_price" value="${mainData.ppDTO.rel_price }" id="rel_price"/>
			</div>
			
			<div class="tttt">발매일</div>
			<div>
				<input type="text" name="rel_dateStr" id="rel_dateStr" value="<fmt:formatDate value="${mainData.ppDTO.rel_date }" pattern="yyyy-MM-dd"/>" readonly="readonly"/>
				<img src="<c:url value="/resources/up/diray.png" />" id="btn_diray1"/>
			</div>
		</div>
		
		<div>
		
		
			<div class="tttt">대표이미지</div>
			<div>
				<input type="file" name="file" id="file" value="${mainData.ppDTO.img1 }" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png"/>
	            <div class="blahdiv"><img id="blah" src='<c:url value="/resources/up/Thumbnail/${mainData.ppDTO.img1}"/>'/></div>
			</div>
			
			
			
		</div>
		
		<div>
			<input type="button" value="뒤로" id="back"/>
			<input type="button" value="수정" id="insert"/>
			<input type="button" value="삭제" id="delete"/>
		</div>
	</div>
</form>
