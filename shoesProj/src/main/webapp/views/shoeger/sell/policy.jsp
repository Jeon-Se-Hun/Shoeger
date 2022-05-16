<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.cont{
	margin: auto;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 80px;
	border-top : 1px solid #eee;
	border-bottom : 1px solid #eee;
	display: flex;
	justify-content: space-around;
	line-height: 40px;
	clear: both;
	
}

.cont > div{
	height: 80px;
}

.cont > div:nth-child(1){
	width: 70%;
}

.cont > div:nth-child(2){
	padding: 15px;
	width: 15%;
	text-align: center;
	line-height: 80px;
}

.check{
	width: 30px;
	height: 30px;
	
}

#prodimg{
	width: 300px;
	height: 300px;
	margin-bottom: 20px;
	float: left;
	border-radius: 20px;
}

#buycon{
	margin: auto;
	width: 150px;
	height: 50px;
	background: #fff;
	border: none;
	border-radius: 20px;
	color: #eee;
	font-family: "HY견고딕";
	font-size: 18px;
}

.modal-footer{
	text-align: center;
}

.abc{
	width: 30px;
	height: 30px;
}

#sellcon{
	margin: auto;
	width: 150px;
	height: 50px;
	background: #fff;
	border: none;
	border-radius: 20px;
	color: #eee;
	font-family: "HY견고딕";
	font-size: 18px;
}

.qq{
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	font-weight: bolder;
	margin-top: 25px;
	
}

#info{
	width: 460px;
	height: 400px;
	float: left;
	padding-top: 10px;
	padding-left: 40px;
	padding-right: 20px;
	
}

#sename{
	font-size: 20px;
	font-weight: bolder;
}

#skname{
	font-size: 16px;
	margin-bottom: 70px;
}

#importantPolicy{
	font-weight: bolder;
}

</style>
</head>
<body>
<script>
	
	
	$("#sellgogo").attr("href", "sellregproceed?model="+model+"&psize="+psize)

	$(function(){
		
	var img = document.getElementById("prodimg");
	img.setAttribute("src","/resources/up/Thumbnail/"+img1);
	
	document.getElementById("sename").innerHTML = ename;
	document.getElementById("skname").innerHTML = kname;
	document.getElementById("smodel").innerHTML = model
	document.getElementById("spsize").innerHTML = psize+"mm";
	document.getElementById("srel_price").innerHTML = rel_price+"원";
	document.getElementById("spid").innerHTML = pid;
	
	
	var bcon = document.getElementById("sellcon")
	//조건이 만족되면 활성화 될 버튼을 아이디로 가져와서 bcon이라는 변수에 넣음
	
	$("input[type='checkbox'].abc").change(function(){		
		if($('.abc:checked').length == $('.abc').length){
			$('#sellcon').attr("disabled", false);
			bcon.style.backgroundColor='#f00';
		}else {
			$('#sellcon').attr("disabled", true);
			bcon.style.backgroundColor='#fff';
		}
	});
	
	
	})
	
	
	
</script>
<div class="modal-header">
    <button class="close" data-dismiss="modal" >x</button>
    <h3>판매 신청 전에 확인해주세요</h3>
</div>
 
<div class="modal-body">

<div><img id="prodimg" src="" alt="" /></div>
<div id= "info">
	<div id = "sename"></div>
	<div id = "skname"></div>
	<div class="qq">
		<div>판매자 ID</div>
		<div id = "spid"></div>
	</div>
	<div class="qq">
		<div>모델명</div>
		<div id = "smodel"></div>
	</div>
	<div class="qq">
		<div>사이즈</div>
		<div id = "spsize"></div>
	</div>
	<div class="qq">
		<div>발매가</div>
		<div id = "srel_price"></div>
	</div>
</div>

<div class="cont">
	<div>
		판매하려는 상품과 위의 정보가 일치합니다.<br>
		(상품 이미지, 모델번호, 상품명을 확인하세요)
	</div>
	<div><input class="abc" id="chk1" type="checkbox" /></div>
</div>

<div class="cont">
	<div>
		판매하실 상품이 국내/해외에서 발매한 정품입니다.<br>
		(검수결과 가품일 경우 반품되며, 택배비는 본인 부담입니다.)
	</div>
	<div><input class="abc" id="chk2" type="checkbox" /></div>
</div>

<div class="cont">
	<div>
		판매신청 후 5일 내에 보유하신 상품을 지정된 주소로 발송해야 합니다.<br>
		(주소 : SHOGER시 SHOGER구 SHOEGER길 SHOEGER GOD정우)
	</div>
	<div><input class="abc" id="chk3" type="checkbox" /></div>
</div>

<div class="cont">
	<div>
		SHOEGER의 최신 이용정책을 모두 확인했으며, 판매를 진행합니다.<br>
		(안전한 거래를 위해 반드시 숙지해야 할 이용정책을 모두 확인했습니다)
	</div>
	<div><input class="abc" id="chk4" type="checkbox" /></div>
</div>
<div class="cont">
	<div id="importantPolicy">
		SHEOGER의 검수 규정에 따라 등급 및 매입가격이 정해지며, 이에 동의합니다.<br>
		(상품의 상태가 최소 기준에 부합되지 않는다면 착불택배로 반송될 수 있습니다.)
	</div>
	<div><input class="abc" id="chk4" type="checkbox" /></div>
</div>
</div>
 
<div class="modal-footer">
    <a id = "sellgogo" href="">
    	<input type="submit" disabled='disabled' id="sellcon" value="판매신청" /><br>
    </a>
    <button class="close" data-dismiss="modal" >닫기</button>
</div>
</body>
</html>