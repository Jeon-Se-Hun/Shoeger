<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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
			var file = $("#file").val()
			if(kname == "" || ename == "" || model == "" || brand == "" || rel_price == "" || file == ""){
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
		
		$("#rel_price").on("propertychange change keyup paste input", function() {
	      var regexp = /[^0-9]/gi
	      $(this).val($(this).val().replace(regexp,''));
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

<form action="newReg" method="post" enctype="Multipart/form-data" id="frm">
<input type="hidden" name="page" id="pageIN" value="${param.page }" />
<input type="hidden" name="skind" id="pageIN" value="${param.skind }" />
<input type="hidden" name="sch" id="pageIN" value="${param.sch }" />
	<div id = table1>
		<br>
		<h3>상품등록</h3>
		
		<div>
			<div class="tttt">상품명</div>
			
			<div id="pppp">
				<div>
					<input type="text" name="kname" class="productName" value="${param.kname }" placeholder="(kor)" />
				</div>
				<hr />
				<div>
					<input type="text" name="ename" class="productName" value="${param.ename }" placeholder="(eng)" />
				</div>
			</div>
			
			<div class="tttt">브랜드</div>
			<div>
				<input type="text" id="brand" name = "brand" value="${param.brand }" readonly="readonly"/>
				<select id="brandlist">
					<option>브랜드 선택</option>
					<c:forEach items="${mainData.brand }" var="bb">
						<option value="${bb }" <c:if test="${param.brand == bb }">selected="selected"</c:if>>${bb }</option>
					</c:forEach>
				</select>
			</div>
			<div class="tttt">모델 번호</div>
			<div>
				<input type="text" name="model" id="model" value="${param.model }"/>
			</div>
			<div class="tttt">가격</div>
			<div>
				<input type="text" name="rel_price" value="${param.rel_price }" id="rel_price"/>
			</div>
			
			<div class="tttt">발매일</div>
			<div>
				<input type="text" name="rel_dateStr" value="${param.rel_dateStr }" id="rel_dateStr" readonly="readonly"/>
				<img src="<c:url value="/resources/up/diray.png" />" id="btn_diray1"/>
			</div>
		</div>
		<div>
			<div class="tttt">대표이미지</div>
			<div>
				<input type="file" name="file" id="file" onchange="readURL(this);" accept="image/gif, image/jpeg, image/png" />
				<div class="blahdiv"><img id="blah" /></div>
			</div>
		</div>
		<div>
			<input type="button" value="뒤로" id="back"/>
			<input type="button" value="등록" id="insert"/>
		</div>
	</div>

</form>
