$(function() {

   $("#inputCertifiedNumber").on("propertychange change keyup paste input", function() {
		var regexp = /[^0-9]/gi
		$(this).val($(this).val().replace(regexp,''));	
   });

	alert("인증번호 발송 완료!");
	var find = document.getElementById('find').value;
	var phone = document.getElementById('phone').value;
	
	$.ajax({
		type: "GET",
		url: "/check/sendSMS",
		data: {
			"phoneNumber": phoneNumber
		},
		success: function(res) {
			$('#checkBtn').click(function() {
				if ($.trim(res) == $('#inputCertifiedNumber').val()) {
					alert("휴대폰 인증이 정상적으로 완료되었습니다.");
					location.href= '/shoeger/member/find?find=' + find + '&phone=' + phone;
					
				} else {
					alert("인증번호가 올바르지 않습니다!");
					$('#inputCertifiedNumber').val("")
				}
			});
		}
	});

});