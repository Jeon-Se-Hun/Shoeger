<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script>
	$(function(){
		
		
		$("#insert").click(function(){
			var kname = $("#kname").val()
			var ename = $("#ename").val()
			var brandprint = $("#brandprint").val()

			var file = $("#file").val()
			if(kname == "" || ename == "" || brandprint == "" ||  file == ""){
				alert("항목을 확인해주세요")
			}else{
				frm.submit();							
			}
		})

		$("#back").click(function(){
			frm.action = "brand"
			frm.submit();
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

<form action="brandInReg" method="post" enctype="Multipart/form-data" id="frm">
<input type="hidden" name="page" id="pageIN" value="${param.page }" />
<input type="hidden" name="skind" id="skind" value="${param.skind }" />
<input type="hidden" name="sch" id="sch" value="${param.sch }" />
	<div id = table1>
		<br>
		<h3>브랜드등록</h3>
		
		<div>
			<div class="tttt">브랜드명</div>
			
			<div id="pppp">
				<div>
					<input type="text" name="kname" class="productName" value="${param.kname }" placeholder="(kor)" />
				</div>
				<hr />
				<div>
					<input type="text" name="ename" class="productName" value="${param.ename }" placeholder="(eng)" />
				</div>
			</div>
			<div class="tttt">출력용 브랜드명</div>
			<div>
				<input type="text" name="brandprint" id="brandprint" value="${param.brandprint }" />
			</div>
			
			<div class="tttt">브랜드 오류성1</div>
			<div>
				<input type="text" id="content1" name = "content1" value="${param.content1 }"/>
			</div>
			<div class="tttt">브랜드 오류성2</div>
			<div>
				<input type="text" name="content2" id="content2" value="${param.content2 }"/>
			</div>
			<div class="tttt">브랜드 오류성3</div>
			<div>
				<input type="text" id="content3" name="content3" value="${param.content3 }"/>
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
