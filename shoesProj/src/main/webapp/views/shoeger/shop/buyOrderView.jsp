<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/shoeger/shop/buyOrderView.css">
</head>
<body>
<script>
	
	
	$("#gogo").attr("href", "payone?model="+model+"&productid="+productid)

	$(function(){
		
	var img = document.getElementById("prodimg");
	
	img.setAttribute("src","/resources/up/used/"+img1);
	
	document.getElementById("ename").innerHTML = ename;
	document.getElementById("kname").innerHTML = kname;
	document.getElementById("model").innerHTML = model;
	document.getElementById("grade").innerHTML = grade;
	document.getElementById("sprice").innerHTML = sprice+"원";
	document.getElementById("size").innerHTML = size+"mm";
	
	var bcon = document.getElementById("buycon")
	//조건이 만족되면 활성화 될 버튼을 아이디로 가져와서 bcon이라는 변수에 넣음
	
	$("input[type='checkbox'].abc").change(function(){		
		if($('.abc:checked').length == $('.abc').length){
			$('#buycon').attr("disabled", false);
			bcon.style.backgroundColor='#f00';
		}else {
			$('#buycon').attr("disabled", true);
			bcon.style.backgroundColor='#fff';
		}
	});
	
	
	})
	
	
	
</script>
<div class="modal-header">
    <button class="close" data-dismiss="modal" >x</button>
    <h3>구매하시기 전에 꼭 확인하세요</h3>
</div>
 
<div class="modal-body">

<div><img id="prodimg" src="" alt="" /></div>
<div id= "info">
	<div id = "ename"></div>
	<div id = "kname"></div>
	<div class="tt">
		<div>모델</div>
		<div id = "model"></div>
	</div>
	<div class="tt">
		<div>사이즈</div>
		<div id = "size"></div>
	</div>
	<div class="tt">
		<div>등급</div>
		<div id = "grade"></div>
	</div>
	<div class="tt">
		<div>가격</div>
		<div id = "sprice"></div>
	</div>
</div>

<div class="cont">
	<div>
		구매하려는 상품이 맞습니다.<br>
		(상품 이미지, 모델번호, 출시일, 상품명을 확인하세요)
	</div>
	<div><input class="abc" id="chk1" type="checkbox" /></div>
</div>

<div class="cont">
	<div>
		국내/해외에서 발매한 정품입니다.<br>
		(모든 구성품이 그대로입니다)
	</div>
	<div><input class="abc" id="chk2" type="checkbox" /></div>
</div>

<div class="cont">
	<div>
		제조사에서 불량으로 인정하지 않는 기준은 하자로 인정하지 않습니다.<br>
		(박스와 상품 컨디션에 민감하시다면 검수 기준을 꼭 확인바랍니다)
	</div>
	<div><input class="abc" id="chk3" type="checkbox" /></div>
</div>

<div class="cont">
	<div>
		SHOEGER의 최신 이용정책을 모두 확인했으며, 구매를 진행합니다.<br>
		(안전한 거래를 위해 반드시 숙지해야 할 이용정책을 모두 확인했습니다)
	</div>
	<div><input class="abc" id="chk4" type="checkbox" /></div>
</div>
</div>
 
<div class="modal-footer">
    <a id = "gogo" href="">
    	<input type="submit" disabled='disabled' id="buycon" value="구매계속" /><br>
    </a>
    <button class="close" data-dismiss="modal" >닫기</button>
</div>
</body>
</html>