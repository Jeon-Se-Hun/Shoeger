<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ProdDetail</title>
</head>
<body>
<script>
var num = 1;
var kname = "<c:out value='${mainData.prodInfo.kname}'/>";
var ename = "<c:out value='${mainData.prodInfo.ename}'/>";
var brand = "<c:out value='${mainData.prodInfo.brand}'/>";
var rel_date = "<c:out value='${mainData.prodInfo.rel_date}'/>";
var rel_price = "<c:out value='${mainData.prodInfo.rel_price}'/>";
var img1 = "<c:out value='${mainData.realimg.img1}'/>";
var img = "<c:out value='${mainData.realimg.img1}'/>";
var imgName = img.substring(0, img.length-6);

function changeImg(idx){
	if(idx){
		if(num==3)
			return;
		num++;
	}else{
		if(num==1)
			return;
		num--;
	}
	console.log(imgName);
	var imgTag = document.getElementById("photo");
	imgTag.setAttribute("src", '<c:url value="/resources/up/used/"/>'+imgName+"_"+num+".png");
}


</script>

<script>
var pid ="<c:out value='${mainData.session.pid}'/>";
var already = "<c:out value='${mainData.already}'/>";
var productid=<%=request.getParameter("productid")%>;
var model = getParameterByName('model'); 
var sold = "<c:out value='${mainData.realimg.sdate}'/>";
var grade = "<c:out value='${mainData.realimg.grade }'/>";
var size = "<c:out value='${mainData.realimg.psize }'/>";
var sprice = "<c:out value='${mainData.realimg.sprice }'/>";

	$(document).ready(function(){
		if(sold != ""){
			alert("이미 판매된 상품입니다.")
			
		}
	})


	$(document).ready(function(){
		if(already=='true' || pid==""){
			$("#sBtn").attr("disabled", true);
			document.getElementById("sBtn").style.backgroundColor = "gray"
			document.querySelector("#zim").removeAttribute("href")
		}
		
	})


	$(document).ready(function(){
	    $("#bBtn").click(function(){
			if(pid==null || pid==''){

				alert("로그인 후 이용하실 수 있습니다")
			}else{	
	        	$("#bBtn1").modal({
	                remote:"/views/shoeger/shop/buyOrderView.jsp"
	            }) 
		      
	    	}
		});
	    $("#sBtn").click(function() {
	       alert("찜목록에 추가되었습니다.");
	       
	    });
	});


function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


$(document).ready(function(){
	sprice = sprice.split(/(?=(?:...)*$)/); 
	sprice = sprice.join(',');
	document.getElementById("bprice").innerHTML = sprice+"원";		
	document.getElementById("bpricebtn").innerHTML = sprice+"원";		
})

</script>

<div id="gobackdiv"><a href="thatList?model=${mainData.realimg.model }&page=${param.page}"><img id = "goback" src='<c:url value="/resources/up/goback.png"/>' alt="" /></a></div>
<div id="outer_jhy">
	<div id="prodImg">
	
	<img id = "photo" src='<c:url value="/resources/up/used/${mainData.realimg.img1 }"/>' />
	<div id="fbbtn">
		<button onclick="changeImg(0);">이전</button>
		<button onclick="changeImg(1);">다음</button>
	</div>
	</div>
	<div id="prodInfo">
		<div>
			<div id="dename">${mainData.prodInfo.ename }</div>
			<div id="dkname">${mainData.prodInfo.kname }</div>
		</div>
		<div class="stockdetail">
			<div>Model</div>
			<div>${mainData.realimg.model }</div>
		</div>
		<div class="stockdetail">
			<div>Size</div>
			<div>${mainData.realimg.psize }mm</div>
		</div>
		<div class="stockdetail">
			<div>등급</div>
			<div>${mainData.realimg.grade }</div>
		</div>
		<div class="stockdetail">
			<div>판매가</div>
			<div id="bprice">${mainData.realimg.sprice }원</div>
		</div>
			
		<div id="sbBtn">
			<a id="zim" href="wishreg?productid=${mainData.realimg.productid}&model=${mainData.prodInfo.model}">
			<button id="sBtn">
				<div id="zzim">찜하기</div>
			</button>
			</a>	
			<button id="bBtn" data-target="#bBtn1">
				<div id="bactionBtn">구매</div>
				<div id="bpricebtn">원</div>
			</button>	
		</div>
	
	</div>
</div>

<div id="whataboutthis">이런 상품은 어떤가요?</div>
<div id="recmOuter">
	<c:forEach items="${mainData.recList }" var="item">
		<div class="recmSubOuter">
			<div class="recmImg"><a href="thatList?model=${item.model }&page=1"><img id="recmImgg" src='<c:url value="/resources/up/Thumbnail/${item.img1 }"/>' alt="이미지없음" /></a></div>
			<div class="recmEname">${item.ename }</div>
		</div>
	</c:forEach>

</div>
   <div class="modal fade" id="bBtn1">
      <div class="modal-dialog">
         <div class="modal-content">
         	<input type="hidden" id="asdf">
         </div>
      </div>
   </div>


</body>
</html>