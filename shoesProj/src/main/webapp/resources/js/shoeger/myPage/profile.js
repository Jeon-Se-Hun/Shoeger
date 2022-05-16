var mailChk = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
var pwChk = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/;

$(function() {
	var phoneChk = /^\d{3}-\d{3,4}-\d{4}$/;

	$("#phone").on("propertychange change keyup paste input", function() {
		phoneChk.test('');
		var ttt = phoneChk.test($(this).val());
		if (ttt) {
			$('#sendPhoneNumber').prop('disabled', false);
		} else {
			$('#sendPhoneNumber').prop('disabled', true);
		}
	});
	$("#psize").on("propertychange change keyup paste input", function() {
      var regexp = /[^0-9]/gi;
         $(this).val($(this).val().replace(regexp,''));
   })
	$("#pname").on("propertychange change keyup paste input", function() {
  		var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
    		$(this).val($(this).val().replace(regexp,''));
   })
   
   var submit1 = true;
   var submit2 = true;
   
   $("#pw").on("propertychange change keyup paste input", function(e) {
      if (pwChk.test($('#pw').val())) {
         $('#pw_check').text('');
         submit1 = true;
      } else {
         $('#pw_check').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
         $('#pw_check').css('color', 'red');
         submit1 = false;
      }
      if(submit1 && submit2) {
          $("#modify").attr("disabled",false )
       }else {
          $("#modify").attr("disabled",true )
       }
   });
   
   $("#email").on("propertychange change keyup paste input", function(e) {
      if (mailChk.test($(this).val())) {
         $("#email_check").text('');
         submit2 = true;
      } else {
         $('#email_check').text('이메일 양식을 확인해주세요.');
         $('#email_check').css('color', 'red');
         submit2 = false;
      }
      
      if(submit1 && submit2) {
          $("#modify").attr("disabled",false )
       }else {
          $("#modify").attr("disabled",true )
         }
   		});
   
});

function sendPhone2() {
	   if (confirm("휴대폰 인증을 하시겠습니까?")) {
              $("#phoneModal").modal({
                 remote: "/views/shoeger/modal/phoneche.jsp",
              });
	   }
	}

	$(function(){
			$("#modify").click(function(){
				frm.action = "modifyReg"
				frm.submit()
			})
		$("#re").click(function(){
			frm.action = "profile"
			frm.submit()
		})
	})