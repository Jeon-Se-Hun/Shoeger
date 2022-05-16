<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
#info_sell{
	width: 100%;
	display: flex;
	justify-content: space-between;
}

#miriimg{
	width: 280px;
	height: 280px;
	border-radius: 20px;
	
}

#info_text{
	width: 70%;
	padding-right: 30px;
	padding-left:  30px;
}

.gg{
	padding: 10px;
	display:flex;
	justify-content: space-between;
	margin-top: 5px;
	margin-bottom: 5px;
	font-size: 16px;
	font-weight: bolder;
}

.modal fade {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 1; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

.modal-content {
   background-color: #fefefe;
   margin: auto; /* 15% from the top and centered */
   padding: 20px;
   left: -20%;
   border: 1px solid #888;
   width: 140%; /* Could be more or less, depending on screen size */
}

#selecbrand{
	width: 200px;
	height: 30px;
	font-size: 14px;
	text-align: center;
}

#picmodel{
	width: 200px;
	height: 30px;
	font-size: 14px;
	text-align: center;
}

#sizeselec{
	width: 200px;
	height: 30px;
	font-size: 14px;
	text-align: center;
}

#sellgo{
	width: 200px;
	height: 40px;
	border : 1px solid #ddd;
	border-radius: 5px;
	background: #eee;
	margin-left: 50px;
	
}

.selecs{
	display: block;
	padding-left: 10px;
	margin-bottom: 50px;
	border: none;
	border-bottom: 1px solid #ccc;
	margin-left: 50px;
}

.txt{
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: bolder;
	padding-left: 50px;
}

#schProd{
	margin-top: -30px;
}

#schsellprod{
	width: 25%;
	height: 380px;
	float: left;
	
	
}

#chktxt{
	font-size: 18px;
	margin-bottom: 40px;
}

#infos{
	width: 75%;
	float: left;
	height: 380px;
	border-right: 1px solid #ccc;
	padding-right: 20px;
}

#chkRule{
	margin-top: 100px;
	width: 100%;
	clear: both;
	height: 150px;
	line-height: 150px;
	text-align: center;
	
}

#sellreq{
	width: 250px;
	height: 50px;
	line-height: 50px;
	background: red;
	color: white;
	border : none;
	font-family: "HY견고딕";
	font-size: 18px;
	border-radius: 10px;
}

#ename{
	font-size: 20px;
	font-weight: bolder;
}

#kname{
	margin-top: 5px;
	font-size: 14px;
	margin-bottom: 40px;
	
}

</style>
 



	



<form action="" id="frm">

<div id="infos">
	<div id="chktxt">해당모델의 정보가 판매하실 상품과 일치하는지 확인하세요</div>	
	<div id="info_sell">
		<div id="info_img">
			<img id="miriimg" src='<c:url value="/resources/up/Thumbnail/${mainData.get(param.model).img1 }"/>' onerror="this.src='<c:url value="/resources/up/alt_1.png"/>'" />
		</div>
		<div id="info_text">
			
			<div id="ename">${mainData.get(param.model).ename }</div>
			<div id="kname">${mainData.get(param.model).kname }</div>
			
			<div class="gg">
				<div>판매자 ID</div>
				<div id="pid">${param.sessionId}</div>
			</div>
			<div class="gg">
				<div>모델명</div>
				<div id="model">${mainData.get(param.model).model }</div>
			</div>
			<div class="gg">
				<div>사이즈</div>
				<div id="psize">${param.psize }mm</div>
			</div>
			<div class="gg">
				<div>발매가</div>
				<div id="rel_price"></div>
			</div>
		</div>
	</div>
</div>

<div id="schsellprod">
	<div class="txt">판매하시려는 상품의 브랜드</div>
	<select name="brand" id="selecbrand" class="selecs">
		<option selected>브랜드를 선택하세요</option>
		<c:forEach items="${mainData.brandname }" var="item">
			<option value="${item }"  <c:if test="${param.brand  == item }">selected="selected"</c:if> >${item }</option>
		</c:forEach>
	</select>

	<div class="txt">해당 브랜드 상품의 모델명</div>
	<select name="model" id="picmodel" class="selecs">
		<option>모델명을 선택하세요</option>
		<c:forEach items="${mainData.get(param.brand) }" var="item">
			<option value="${item }"  <c:if test="${param.model  == item }">selected="selected"</c:if> >${item }</option>
		</c:forEach>	
	</select>

	<div class="txt">판매하실 상품의 사이즈</div>
		<select name="psize" id="sizeselec" class="selecs">
			<c:forEach begin="220" end="300" step="5" var="cnt" >
				<option <c:if test="${param.psize  == cnt }">selected="selected"</c:if>>${cnt }</option>
			</c:forEach>
		</select>
	<div>
	<input type="hidden" name="sessionId" value="${mainData.session }" />
	</div>
<div id="schProd">	
	<input type="submit" id="sellgo" value="해당 모델 검색하기" />
</div>
</div>

</form>
<div id="chkRule">
	<button id="sellreq" data-target="#sellreq1">판매 전 약관 확인</button>
</div>



   <div class="modal fade" id = 'sellreq1'>
      <div class="modal-dialog">
         <div class="modal-content">
         	<input type="hidden" id="asdf">
         </div>
      </div>
   </div>
</body>
<script>

var pid = "<c:out value='${param.sessionId}'/>";
var psize = "<c:out value='${param.psize}'/>";
var rel_price = "<c:out value='${mainData.get(param.model).rel_price}'/>";
var accountnum = "<c:out value='${mainData.get(\"cliInfo\").accountnum}'/>"; 
var img1 = "<c:out value='${mainData.get(param.model).img1 }'/>";
var kname = "<c:out value='${mainData.get(param.model).kname }'/>";
var ename = "<c:out value='${mainData.get(param.model).ename }'/>";
var model = "<c:out value='${mainData.get(param.model).model }'/>";

$(document).ready(function(){
	if(pid=='')
	document.getElementById("pid").innerHTML = "로그인이 필요합니다."
})



$(document).ready(function(){
	$("#selecbrand").change(function(){
			frm.submit();
		
	})
})

$(document).ready(function(){
	rel_price = rel_price.split(/(?=(?:...)*$)/); 
	rel_price = rel_price.join(',');
	document.getElementById("rel_price").innerHTML = rel_price+"원";		
})



var pid ="<c:out value='${mainData.session}'/>";
var picmodel = "<c:out value='${mainData.get(param.model).model }'/>";


	$(document).ready(function(){
	    $("#sellreq").click(function(){
			console.log(picmodel);
		    if(pid!=null && pid!=("") && accountnum!=null && accountnum!=("") && picmodel==("")){	
		    	alert("판매하실 품목을 검색하여 확인해주세요")
		    }else if(pid!=null && pid!=("") && accountnum!=null && accountnum!=("")){
	        	$("#sellreq1").modal({
	                remote:"/views/shoeger/sell/policy.jsp"
	            }) 
			}else if(pid!=("") && (accountnum==("") || accountnum==null)){
				alert("마이페이지에서 판매정산계좌를 등록해주세요");
			
			}else {
				alert("로그인 후 이용하실 수 있습니다")
		    
	    	}
		});
	});

</script>	