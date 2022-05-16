$(function() {
   var phoneChk = /^\d{3}-\d{3,4}-\d{4}$/;

   $("#phone").on("propertychange change keyup paste input", function() {
      phoneChk.test('');

	 var regexp = /[^0-9-]/gi
   	 $(this).val($(this).val().replace(regexp,''));

     var ttt = phoneChk.test($(this).val());

      if (ttt) {
         $('#sendPhoneNumber').prop('disabled', false);
         $('#sendPhoneNumber').css('background-color', "#eee");
      } else {
         $('#sendPhoneNumber').prop('disabled', true);
         $('#sendPhoneNumber').css('background-color', "#fff");
      }
   });
});

function sendPhone() {
   phoneNumber = $('#phone').val();
   if (confirm("휴대폰 인증을 하시겠습니까?")) {
      $.ajax({
         type: 'POST',
         data: JSON.stringify({ phone: document.getElementById('phone').value }),
         url: "/clientChk.do",
         contentType: "application/json;charset=UTF-8",
         success: function(data) {
            if (data.dto != null) {
               $("#phoneModal").modal({
                  remote: "/views/shoeger/modal/findReg.jsp"
               });
            } else {
               alert("회원가입 먼저 해주세요.");
               location.href = '/shoeger/member/login';
            }
         },
      });

   }
}