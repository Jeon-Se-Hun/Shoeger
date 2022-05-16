$(function() {
   //아이디 정규식 
   var idChk = /^[a-z]+[a-z0-9]{5,12}$/g; 
   // 비밀번호 정규식 
   var pwChk = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/; 

   var submit1 = false;
   var submit2 = false;
   
   $("#pid").on("propertychange change keyup paste input", function() {
      idChk.test('');
      
      var ttt = idChk.test($(this).val());
      
       if(ttt) {
         $('#pid_check').text('');
         submit1 = true;
       }else {
         $('#pid_check').text('영문으로 시작하는 6~12자의 영문, 숫자 조합'); 
         $('#pid_check').css('color', 'red'); 
         submit1 = false;
       }
       
       if(submit1 && submit2) {
          $('#login').prop('disabled', false);
           $('#login').css('background-color', '#ccc');
       }else {
          $('#login').prop('disabled', true);
          $('#login').css('background-color', '#fff');
       }
   });

   $("#pw").on("propertychange change keyup paste input", function() {
      pwChk.test('');
      
      var ppp = pwChk.test($(this).val());
      
       if(ppp) {
         $('#pw_check').text('');
         submit2 = true;
       }else {
          $('#pw_check').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.'); 
          $('#pw_check').css('color', 'red');
          submit2 = false;
       }
       
       if(submit1 && submit2) {
          $('#login').prop('disabled', false);
          $('#login').css('background-color', '#ccc');
       }else {
          $('#login').prop('disabled', true);
          $('#login').css('background-color', '#fff');
       }
       
   });
   
   $("#form").on("submit", function() {
      var list = {
            pid : document.getElementById('pid').value,
            pw : document.getElementById('pw').value
      };
      
         $.ajax({
           async : false,
         type : 'POST',
         data : JSON.stringify(list),
         url : "/clientChk.do",
         contentType : "application/json",
         success : function(data) {
            if(data.dto != null) {
               form.action = "/shoeger?kind=" + data.dto.kind
            }else {
               alert("ID 또는 비밀번호를 확인해주세요");
            }
         },
         error : function(error) {
                alert("error : " + error);
            }
      });
   });
   
});