<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="/resources/js/shoeger/myPage/phoneche.js"></script>


<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
   <h2>휴대폰 인증</h2>
</div>

<div class="modal-body">
   <span class="box int_mobile"> 
      <input type="tel" class="int" maxlength="13" placeholder="전화번호 입력" id="phonebuf">
   </span>
   <div id="phoneche_check"></div>
   <div class="btn_phone">
      <button disabled type="button" id="sendPhoneNumbera" onclick="sendPhone1();" >
         <span>인증번호 받기</span>
      </button>
   </div>
   
   <input type="text" placeholder="인증번호" maxlength="4" id="inputCertifiedNumber" class="add">
   <button type="button" id="checkBtn" class="btn btn-secondary">인증</button>
   <button class="close" data-dismiss="modal">닫기</button>
</div>
