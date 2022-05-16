var phoneChk = /^\d{3}-\d{3,4}-\d{4}$/;
function sendPhone1() {
      phoneNumber = $('#phonebuf').val();
      if (confirm("휴대폰 인증을 하시겠습니까?")) {
         $.ajax({
            async: false,
            type: 'POST',
            data: JSON.stringify({ phone: document.getElementById('phonebuf').value }),
            url: "/clientChk.do",
            contentType: "application/json;charset=UTF-8",
            success: function(data) {
               if (data.dto != null) {
                  alert("이미 등록된 번호입니다.");
                  location.href = '/shoeger/myPage/myy/profile';
               } else {
                     alert("인증번호 발송 완료!")

                      $.ajax({
                        type: "GET",
                        url: "/check/sendSMS",
                        data: {
                           "phoneNumber" : phoneNumber
                        },
                        success: function(res){
                            $('#checkBtn').click(function(){
                               if($.trim(res) == $('#inputCertifiedNumber').val()) {
                                  alert("휴대폰 인증이 정상적으로 완료되었습니다.");
                                 $('#phone').val(phoneNumber)
                                 $('#phoneModal').modal("hide");
                               }else {
                                  alert("인증번호가 올바르지 않습니다!");
                                  $('#inputCertifiedNumber').val("") 
                               }
                           });
                        }
                     }); 
               }
            },
         });

      }
   }
$(function() {
   
   $("#phonebuf").on("propertychange change keyup paste input", function() {
         var regexp = /[^0-9-]/gi;
         $(this).val($(this).val().replace(regexp,''));
     if (phoneChk.test($(this).val())) {
         $("#phoneche_check").text('')
         $("#sendPhoneNumbera").prop("disabled", false);
      } else {
         $('#phoneche_check').text('휴대폰번호를 확인해주세요 ');
         $('#phoneche_check').css('color', 'red');
         $("#sendPhoneNumbera").prop("disabled", true);
      }
   })
   $("#inputCertifiedNumber").on("propertychange change keyup paste input", function() {
         var regexp = /[^0-9]/gi;
            $(this).val($(this).val().replace(regexp,''));         
   })   
   
   
})