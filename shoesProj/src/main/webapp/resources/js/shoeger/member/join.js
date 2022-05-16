//아이디 정규식 
var idChk = /^[a-z]+[a-z0-9]{5,12}$/g;
// 비밀번호 정규식 
var pwChk = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/;
// 이름 정규식 
var nameChk = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식 
var mailChk = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

// 휴대폰 번호 정규식 
var phoneChk = /^\d{3}-\d{3,4}-\d{4}$/;

var address = '';

var phoneNumber = '';

var inval_Arr = new Array(8).fill(false);

var phoneBtn = false;

var regexp1 = /[^0-9]/gi

$(function() {

	$("#pid").blur(function() {
		idChk.test('')
		var tt = idChk.test($(this).val())

		if ($(this).val() == '') {
			$('#id_check').text('아이디를 입력하세요.');
			$('#id_check').css('color', 'red');
			inval_Arr[0] = false;
		} else if (tt == true) {
			$.ajax({
				async: true,
				type: 'POST',
				data: JSON.stringify({ pid: $(this).val() }),
				url: "/clientChk.do",
				contentType: "application/json;charset=UTF-8",
				success: function(data) {
					if (data.dto != null) {
						$('#id_check').text("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
						$('#id_check').css('color', 'red');
						$("#pid").val("");
						$("#pid").focus();
						inval_Arr[0] = false;

					} else {
						$('#id_check').text('사용가능한 아이디 입니다.');
						$('#id_check').css('color', 'blue');
						$("#pw").focus();
						inval_Arr[0] = true;
					}
				},
			});

		} else if (tt != true) {
			$('#id_check').text('영문으로 시작하는 6~12자의 영문, 숫자 조합');
			$('#id_check').css('color', 'red');
			inval_Arr[0] = false;
		}

	});

	$('#btnJoin').click(function() {

		if (!phoneBtn) {
			alert("휴대폰 인증을 해주세요");
			return;
		}

		if ($('#check_all').is(":checked") != true) {
			alert("이용약관 전부 동의 해주세요.")
			return;
		}

		var birthJ = false;

		if ($('#year_check').text('') && $('#month_check').text('') && $('#day_check').text('') &&
			$('#year').val() != '' && $('#month').val() != '' && $('#day').val() != '') {
			birthJ = true;
		}

		// 생년월일 정규식 
		if (birthJ) {
			inval_Arr[3] = true;
			document.getElementById('birthYear').value = $('#year').val();
			document.getElementById('birthDay').value = $('#month').val() + '-' + $('#day').val();
		} else {
			inval_Arr[3] = false;
		}
		//주소확인 
		if (address == '') {
			inval_Arr[6] = false;
		} else {
			inval_Arr[6] = true;
			address += document.getElementById('detailaddress').value;
			document.getElementById('address1').value = address;
		}
		//전체 유효성 검사 
		var validAll = true;

		for (var i = 0; i < inval_Arr.length; i++) {
			if (inval_Arr[i] == false) {
				validAll = false;
			}
		}

		if (validAll == true) {
			$("#phone").prop("disabled", false);
			alert('회원가입 완료');
			frm.submit();
		} else {
			alert('정보를 다시 확인하세요.')
		}

	});

	$("#pw").on("propertychange change keyup paste input", function(e) {
		if (pwChk.test($('#pw').val())) {
			$('#pw_check').text('');
			inval_Arr[2] = true;

		} else {
			$('#pw_check').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			$('#pw_check').css('color', 'red');
			inval_Arr[2] = false;
		}

		if ($('#pw2').val() != $(this).val() && $('#pw2').val() != '') {
			$('#pw2_check').text('비밀번호를 다시 확인 해주세요.');
			$('#pw2_check').css('color', 'red');
			inval_Arr[1] = false;
		} else if ($('#pw2').val() == '') {
			inval_Arr[1] = false;
		} else {
			$('#pw2_check').text('');
			inval_Arr[1] = true;
		}
	});

	//1~2 패스워드 일치 확인 
	$("#pw2").on("propertychange change keyup paste input", function(e) {
		if ($('#pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
			inval_Arr[1] = false;
		} else {
			$('#pw2_check').text('');
			inval_Arr[1] = true;
		}
	});


	$("#pname").on("propertychange change keyup keypaste input", function(e) {

		var replaceName = /^[가-힣a-zA-Z\s]+$/
		var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		$(this).val($(this).val().replace(regexp, '').substr(0, 4));

		if ($(this).val().length >= 2) {
			if ($(this).val().match(replaceName)) {
				if (nameChk.test($(this).val())) {
					$("#name_check").text('');
					inval_Arr[4] = true;
				} else {
					$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
					$('#name_check').css('color', 'red');
					inval_Arr[4] = false;
				}
			} else {
				$('#name_check').text('이름을 다시 확인 해주세요.');
				$('#name_check').css('color', 'red');
				inval_Arr[4] = false;
			}
		} else {
			$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
			$('#name_check').css('color', 'red');
			inval_Arr[4] = false;
		}
	});

	$("#email").on("propertychange change keyup paste input", function(e) {
		if (mailChk.test($(this).val())) {
			$("#email_check").text('');
			inval_Arr[7] = true;
		} else {
			$('#email_check').text('이메일 양식을 확인해주세요.');
			$('#email_check').css('color', 'red');
			inval_Arr[7] = false;
		}
	});

	$("#year").on("propertychange change keyup paste input", function(e) {
		$(this).val($(this).val().replace(regexp1, ''));

		var year = $(this).val();
		var yearNow = new Date().getFullYear();

		if (year > yearNow || year < 1900) {
			$('#year_check').text('년도를 확인해주세요');
			$('#year_check').css('color', 'red');
		} else {
			$('#year_check').text('');

			if ($('#month').val() != '월' && $('#day').val() != '') {
				dayCheck();
			}

		}
	});

	$('#month').change(function() {
		if ($(this).val() == '월') {
			$('#month_check').text('월을 확인해주세요 ');
			$('#month_check').css('color', 'red');
		} else {
			$('#month_check').text('');

			if ($('#day').val() != '') {
				dayCheck();
			}
		}
	});

	$("#day").on("propertychange change keyup paste input", function(e) {
		$(this).val($(this).val().replace(regexp1, ''));
		dayCheck();
	});

	$("#phone").on("propertychange change keyup paste input", function(e) {
		var regexp = /[^0-9-]/gi
		$(this).val($(this).val().replace(regexp, ''));

		if (phoneChk.test($(this).val())) {
			$("#phone_check").text('')
			$("#sendPhoneNumber").prop("disabled", false);
			$('#sendPhoneNumber').css('background-color', "#eee");
			inval_Arr[5] = true;
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 ');
			$('#phone_check').css('color', 'red');
			$("#sendPhoneNumber").prop("disabled", true);
			$('#sendPhoneNumber').css('background-color', "#fff");
			inval_Arr[5] = false;
		}
	});

	// 체크박스 전체 선택
	$(".checkbox_group").on("click", "#check_all", function() {
		$(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
	});

	// 체크박스 개별 선택
	$(".checkbox_group").on("click", ".normal", function() {
		var is_checked = true;

		$(".checkbox_group .normal").each(function() {
			is_checked = is_checked && $(this).is(":checked");
		});

		$("#check_all").prop("checked", is_checked);
	});

});

function sendPhone() {
	phoneNumber = $('#phone').val();
	if (confirm("휴대폰 인증을 하시겠습니까?")) {
		$.ajax({
			async: false,
			type: 'POST',
			data: JSON.stringify({ phone: document.getElementById('phone').value }),
			url: "/clientChk.do",
			contentType: "application/json;charset=UTF-8",
			success: function(data) {
				if (data.dto != null) {
					alert("이미 회원가입 하셨습니다.");
					location.href = '/shoeger/member/login';
				} else {
					$("#phoneModal").modal({
						remote: "/views/shoeger/modal/phone.jsp",
					});
				}
			},
		});

	}
}

function dayCheck() {
	var year = $('#year').val();
	var month = $('#month').val();
	var day = $('#day').val();

	if (day < 1 || day > 31) {
		$('#day_check').text('일을 확인해주세요 ');
		$('#day_check').css('color', 'red');

	} else if ((month == 4 || month == 6 || month == 9 || month == 11) && day == 31) {
		$('#day_check').text('일을 확인해주세요 ');
		$('#day_check').css('color', 'red');

	} else if (month == 2) {
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day > 29 || (day == 29 && !isleap)) {
			$('#day_check').text('일을 확인해주세요 ');
			$('#day_check').css('color', 'red');
		} else {
			$('#day_check').text('');
		}
	} else {
		var date = new Date();

		var nowYear = date.getFullYear();
		var nowMonth = date.getMonth()+1;
		var nowDay = date.getDate();

		if ((nowDay + "").length < 2) {
			nowDay = "0" + nowDay;
		}
		
		if ((nowMonth + "").length < 2) {
			nowMonth = "0" + nowMonth;
		}
		
		if ((day + "").length < 2) {
			day = "0" + day;
		}

		var getDate = nowYear + nowMonth + nowDay;
		var getuserDate = year + month + day;
		
		if (eval(getDate) >= getuserDate) {
			$('#day_check').text('');
		}else {
			$('#day_check').text('날짜를 확인 해주세요.');
			$('#day_check').css('color', 'red');
		}
	}
}

function terms(obj) {
	$('.modal-body').scrollTop(0)
	$("#" + obj).modal({
		remote: '/views/shoeger/modal/' + obj + '.jsp'
	});
}

//우편번호 찾기 버튼 클릭시 발생 이벤트 
function execPostCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
			// 도로명 주소의 노출 규칙에 따라 주소를 조합한다. 
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
			var fullRoadAddr = data.roadAddress;
			// 도로명 주소 변수 
			var extraRoadAddr = '';
			// 도로명 조합형 주소 변수 
			// 법정동명이 있을 경우 추가한다. (법정리는 제외) // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다. 
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다. 
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다. 
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			$("[id=mem_oaddress]").val(data.zonecode);
			$("[id=mem_address]").val(fullRoadAddr);
			//$('#detailaddress')

			address = '(' + document.getElementById('mem_oaddress').value + ') ' + document.getElementById('mem_address').value
				+ ' ';

		}
	}).open();
}