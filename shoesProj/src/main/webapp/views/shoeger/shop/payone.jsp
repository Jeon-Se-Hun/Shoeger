<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Insert title here</title>
</head>
<body>

<form action="" name="finpay" method="post">
<input type="hidden" name="pid" value="${mainData.clientInfo.pid }" />
<input type="hidden" name="productid" value="${mainData.stockInfo.productid }" />
<input type="hidden" name="totalPrice" id="ttPrice" value="${mainData.stockInfo.sprice }" />
<input type="hidden" name="newFinalPoint" id="nfPoint" value="" />
<div id="ccc">
   <div class="subOuter1">
      <div id="ii"><img id="iii" src='<c:url value="/resources/up/used/${mainData.stockInfo.img1 }"/>' /></div>
      <div id = "pp">
         <div class="title" id="proinf">상품정보</div>
         <div class="bbb">
            <div>상품명</div>
            <div>${mainData.prodInfo.ename }</div>
         </div>
         <div class="bbb">
            <div>모델</div>
            <div>${mainData.prodInfo.model }</div>
         
         </div>
      
         <div class="bbb">
            <div>제품가격</div>
            <script>
               value = "${mainData.stockInfo.sprice }";
               value = value.split(/(?=(?:...)*$)/);
               value = value.join();
            </script>
            <div><script>document.write(value);</script>원</div>
            <input type="hidden" id="sprice" value="${mainData.stockInfo.sprice }" />
         </div>
         
      
      </div>
   </div>
   
   <div class="subOuter2">
      <div class="title">주문자 정보</div>
      <div class="bbb">
         <div>성명</div>
         <div>${mainData.clientInfo.pname }</div>
      </div>
      <div class="bbb">
         <div>e-mail</div>
         <div>${mainData.clientInfo.email }</div>
      </div>
      <div class="bbb">
         <div>H.P</div>
         <div>${mainData.clientInfo.phone }</div>
      </div>
   
   
   
   </div>

   <div class="subOuter2">
      <div class="title">결제정보</div>
      <div class="bbb">
         <div>카드사</div>
         <!-- 삼성, 국민, 우리, 씨티, 새마을, 농협 -->
         <select id="cardchoice">
            <option selected>${mainData.clientInfo.card }</option>
            <option>삼성</option>
            <option>국민</option>
            <option>우리</option>
            <option>씨티</option>
            <option>새마을</option>
            <option>농협</option>
         </select>
               
      </div>
      <div class="bbb">
         <div>카드번호</div>
         <div>
         <input type="text" class="cdn" id="mycardnum1" maxlength="4" value="${mainData.cardnum[0] }" />
         <input type="text" class="cdn" id="mycardnum2" maxlength="4" value="${mainData.cardnum[1] }" />
         <input type="text" class="cdn" id="mycardnum3" maxlength="4" value="${mainData.cardnum[2] }" />
         <input type="text" class="cdn" id="mycardnum4" maxlength="4" value="${mainData.cardnum[3] }" />
         </div>
      </div>
      <div class="bbb">
         <div id="cdcd"></div>
      </div>
      
      
   </div>
   
   <div class="subOuter2">
      <div class="title">포인트 내역</div>
      <div class="bbb">
         <div>보유 포인트</div>
         <div>${mainData.clientInfo.point}p</div>      
      </div>
      
      <div class="bbb">
         <div>사용할 포인트</div>
         <input type="text" class="inp" name="pointuse" id="pointuse" value="0" />      
      </div>
      <div class="bbb">
         <div>이번 구매로 누적될 포인트</div>
         <input type="text" class="inp" readonly="readonly" id="pluspoint" value="${mainData.stockInfo.sprice*0.005 }p" />      
      </div>
      <div class="bbb">
         <div>구매 후 잔여포인트</div>
         <input type="text" class="inp" readonly="readonly" name="finalpoint" id="finalpoint" value="${mainData.clientInfo.point+mainData.stockInfo.sprice*0.005}" />   
      </div>
      <div id="qwe" class="bbb">
         <div>최종 결제 금액</div>
         <input type="text" class="inp" readonly="readonly" id="showfprice" value="${mainData.stockInfo.sprice }원" />      
         <script>
            value = "${mainData.stockInfo.sprice }";
            value = value.split(/(?=(?:...)*$)/);
            value = value.join();
         </script>
         <input type="text" class="inp" readonly="readonly" name="totalprice" id="finalpay" value="" />
         <script>
            $("#finalpay").val(value+"원");
         </script>      
      </div>
   </div>
   <div id="paybtns">
   <input type="button" id="realpay" onclick="javascript:gogopay()" value="" />
   <input type="button" id="fakepay" onclick="javascript:gogopay1()" value="구매하기" />
   </div>
</div>


<script>


function price(value){
      
    value = value.split(/(?=(?:...)*$)/)
    value = value.join(',')
    
    return value
  }
  
$(function(){

var prepoint = "<c:out value='${mainData.clientInfo.point}'/>";
var prodprice = "<c:out value='${mainData.stockInfo.sprice}'/>";
var pluspoint = $("#pluspoint").val();
   
$("#pointuse").on("keyup change keydown", function(){
   var usepoint = $("#pointuse").val();
   var pointuse = $(this).val()
   if(parseInt(usepoint) > parseInt(prepoint)){
      $("#pointuse").val(prepoint);
      usepoint = $("#pointuse").val();
   }
   
   var finalpay = prodprice-usepoint;
   var showfinal = prodprice+"원-"+$('#pointuse').val()+"p";
   var mpoint = parseInt(prepoint) + parseInt(pluspoint);

   $("#ttPrice").val(finalpay);
   $("#nfPoint").val(mpoint-usepoint);
   $("#finalpoint").val((mpoint-usepoint)+"p");
   $("#finalpay").val(price(finalpay+"")+"원");
   $("#showfprice").val(showfinal);
});

$("#pointuse").on("propertychange change keyup paste input", function() {
    var regexp = /[^0-9]/gi;
       $(this).val($(this).val().replace(regexp,''));
 })

 
 $(".cdn").on("propertychange change keyup paste input", function() {
    var regexp = /[^0-9]/gi;
       $(this).val($(this).val().replace(regexp,''));
 })
 
     
})
  
  
     
        function validatecardnumber(cardnumber) {
         
           //빈칸과 대시 제거
           cardnumber = cardnumber.replace(/[ -]/g,'');
    
           //카드 번호가 유효한지 검사
           //정규식이 캡처 그룹들 중 하나에 들어있는 숫자를 캡처
           var match = /^(?:(94[0-9]{14})|(4[0-9]{12}(?:[0-9]{3})?)|(5[1-5][0-9]{14})|(6(?:011|5[0-9]{2})[0-9]{12})|(3[47][0-9]{13})|(3(?:0[0-5]|[68][0-9])[0-9]{11})|((?:2131|1800|35[0-9]{3})[0-9]{11}))$/.exec(cardnumber);
          
           if(match) {
    
               //정규식 캡처 그룹과 같은 순서로 카드 종류 나열
               var types = ['BC', 'Visa', 'MasterCard', 'Discover', 'American Express', 'Diners Club', 'JCB'];
    
               //일치되는 캡처 그룹 검색
               //일치부 배열의 0번째 요소 (전체 일치부중 첫 일치부)를 건너뜀
               for(var i = 1; i < match.length; i++) {
                   if(match[i]) {
                       //해당 그룹에 대한 카드 종류를 표시
                       $('#cdcd').text(types[i-1])
                       break;
                   }
               }
    
           }else if($('#cardnum').val() == ''){
              $('#cdcd').text('(카드 번호가 입력되지 않았습니다)')
           }else {
               $('#cdcd').text('(잘못된 카드 번호)')
           }
       }
       
       $(function(){
          var cardnum1 = $("#mycardnum1").val();
          var cardnum2 = $("#mycardnum2").val();
          var cardnum3 = $("#mycardnum3").val();
          var cardnum4 = $("#mycardnum4").val();
          
          var cardnumber = cardnum1+cardnum2+cardnum3+cardnum4;
          validatecardnumber(cardnumber);
          
          $("#mycardnum1").keyup(function(){
             cardnum1 = $("#mycardnum1").val();
             cardnum2 = $("#mycardnum2").val();
             cardnum3 = $("#mycardnum3").val();
             cardnum4 = $("#mycardnum4").val();
             
             cardnumber = cardnum1+cardnum2+cardnum3+cardnum4;
             validatecardnumber(cardnumber);
          })
          
          $("#mycardnum2").keyup(function(){
             cardnum1 = $("#mycardnum1").val();
             cardnum2 = $("#mycardnum2").val();
             cardnum3 = $("#mycardnum3").val();
             cardnum4 = $("#mycardnum4").val();
             
             cardnumber = cardnum1+cardnum2+cardnum3+cardnum4;
             validatecardnumber(cardnumber);
          })
          
          $("#mycardnum3").keyup(function(){
             cardnum1 = $("#mycardnum1").val();
             cardnum2 = $("#mycardnum2").val();
             cardnum3 = $("#mycardnum3").val();
             cardnum4 = $("#mycardnum4").val();
             
             cardnumber = cardnum1+cardnum2+cardnum3+cardnum4;
             validatecardnumber(cardnumber);
          })
          
          $("#mycardnum4").keyup(function(){
             cardnum1 = $("#mycardnum1").val();
             cardnum2 = $("#mycardnum2").val();
             cardnum3 = $("#mycardnum3").val();
             cardnum4 = $("#mycardnum4").val();
             
             cardnumber = cardnum1+cardnum2+cardnum3+cardnum4;
             validatecardnumber(cardnumber);
          })
       })
     

function gogopay(){
   var cardbankselec = document.getElementById("cardchoice");
   var cardbank = cardbankselec.options[cardbankselec.selectedIndex].value;
   var cardnum1 = $("#mycardnum1").val();
   var cardnum2 = $("#mycardnum2").val();
   var cardnum3 = $("#mycardnum3").val();
   var cardnum4 = $("#mycardnum4").val();
   
   
   
   if(cardbank==null || cardbank=="" || cardnum1==null || cardnum1=="" || cardnum2==null || cardnum2=="" || cardnum3==null || cardnum3=="" || cardnum4==null || cardnum4==""){
      alert("결제정보를 확인해주세요");
      
   }else{
      finpay.action="kakaopay";
      finpay.submit();
   }
}
       
       function gogopay1(){
          var cardbankselec = document.getElementById("cardchoice");
          var cardbank = cardbankselec.options[cardbankselec.selectedIndex].value;
          var cardnum1 = $("#mycardnum1").val();
          var cardnum2 = $("#mycardnum2").val();
          var cardnum3 = $("#mycardnum3").val();
          var cardnum4 = $("#mycardnum4").val();
          
          
          
          if(cardbank==null || cardbank=="" || cardnum1==null || cardnum1=="" || cardnum2==null || cardnum2=="" || cardnum3==null || cardnum3=="" || cardnum4==null || cardnum4==""){
             alert("결제정보를 확인해주세요");
             
          }else{
            finpay.action="payreg";
             finpay.submit();
          }
       }
       
</script>
</form>

</body>
</html>