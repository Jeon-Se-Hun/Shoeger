<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="/resources/js/shoeger/myPage/account.js"></script>

<div class="rbgus">
   <h1>판매 정산 계좌</h1>
   <br>
   <h3>기본 정보</h3>
   <br>
   <input type="text" readonly="readonly" placeholder="은행 : ${clidata.cli.account}">
   <br>
   <br>
   <input type="text" readonly="readonly" placeholder="계좌번호 : ${clidata.cli.accountnum}">
   <br>
   <br>
   <input type="text" readonly="readonly" placeholder="예금주명 : ${clidata.cli.accountname}">
   <br>
   <br>
</div>

<form id="frm" action="" method="post">
   <input type="hidden" name="service2" value="${service2 }">
   <div class="rbgus">
      <br>
      <h3>변경 정보</h3>
      <br>
      <h4>은행</h4>
      <select id="account" name="account" size="1">
         <option value="">선택하세요</option>
         <option value="삼성">삼성</option>
         <option value="국민">국민</option>
         <option value="우리">우리</option>
         <option value="시티">시티</option>
         <option value="새마을">새마을</option>
         <option value="농협">농협</option>
      </select> <br> <br>
      <h4>계좌번호</h4>
      <div>
         <input type="text" id="accountnum" maxlength="14" name="accountnum" placeholder="계좌번호" value="">
      </div>
      <br>
      <h4>예금주명</h4>
      <div>
         <input type="text" id="accountname" name="accountname" placeholder="예금주명" value="">
      </div>
      <br>
      <div><input type="button" id="modify" disabled="disabled"  name="${service2 }" value="변경"/></div>

   </div>
</form>