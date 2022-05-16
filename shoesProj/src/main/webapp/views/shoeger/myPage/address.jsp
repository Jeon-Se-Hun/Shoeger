<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/shoeger/myPage/address.js"></script>

<div class="rbgus">
   <h1>주소 정보</h1>
   <br>
   <h3>배송지 정보</h3>
   <br>
   <input type="text" readonly="readonly" placeholder="${clidata.cli.address2}">
   <br>
   <br>
   <input type="text" readonly="readonly" placeholder="${clidata.cli.maddress}">
   <br>
   <br>
   <input type="text" readonly="readonly" placeholder="${clidata.cli.address3}">
   
</div>
<form id="frm" action="" method="post">
   <input type="hidden" name="service2" value="${service2 }">
   <div class="rbgus">
      <br>
      <br>
      <h3>배송지 정보 변경</h3>
      <br>
      <div>
         <input type="text" id="address2" name="address2" placeholder="이름" value="">
      </div>
      <br>
      <br>
      <div>
         <input placeholder="우편번호" id="mem_oaddress" type="text" readonly="readonly">
         <input id="modify1" type="button" onclick="execPostCode();" class="trad" value="우편번호 찾기">
      </div>
      <br>
      <div>
         <input placeholder="도로명 주소" id="mem_address" type="text"
            readonly="readonly" /> <br><br>
            <input placeholder="상세주소" id="addressDetail" type="text" />
      </div>
      <br>
      <br>
      <div>
         <input type="text" id="address3" maxlength="13" name="address3" placeholder="전화번호" value="">
      </div>
      <input type="hidden" id="realaddress" name="maddress"> <br>
      <div><input type="button" id="modify" disabled="disabled"  name="${service2 }" value="변경"/></div>
   </div>
</form>