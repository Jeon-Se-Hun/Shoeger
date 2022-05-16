$(function() {
	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
			results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	var find = getParameterByName('find');

	var change1 = false;
	var change2 = false;

	phone = getParameterByName('phone');

	var pwChk = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}/;

	$.ajax({
		async: false,
		type: 'POST',
		data: JSON.stringify({
			phone: phone
		}),
		url: "/clientChk.do",
		contentType: "application/json;charset=UTF-8",
		success: function(data) {
			if (data.dto != null) {
				if (find == 'id') {
					var input1 = "<div><input type='button' value='로그인' class='find_btn' onclick=location.href='/shoeger/member/login'></div>"
					$('#box').text(data.dto.pid.substring(0,data.dto.pid.length-4) + "****");
					$('#box').append(input1);
				} else {
					var div1 = "<div><h3 class='find_title'><label for='pswd1'>비밀번호</label></h3><span class='box'><input type='password' name='pw' class='int' placeholder='숫자,영문(대,소문자),특수문자 조합 최소 8자' id='pw'></span><div id='pw_check' class='pw_text'></div></div>";
					var div2 = "<div><h3 class='find_title'><label for='pswd2'>비밀번호 재확인</label></h3><span class='box'><input type='password' name='pw2' class='int' id='pw2'></span><div id='pw2_check' class='pw_text'></div></div>";
					var btn = "<button type='button' onclick='changePw()' disabled='disabled' id='change' class='find_btn'>변경</button>";

					$('#box').append(div1);
					$('#box').append(div2);
					$('#box').append(btn);
				}
			}
		},
	});

	$("#pw").on("propertychange change keyup paste input", function() {
		pwChk.test('');

		var ppp = pwChk.test($(this).val());

		if (ppp) {
			$('#pw_check').text('');
			change1 = true;
		} else {
			$('#pw_check').text('비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.');
			change1 = false;
		}

		if ($('#pw2').val() != $(this).val() && $('#pw2').val() != '') {
			$('#pw2_check').text('비밀번호를 다시 확인 해주세요.');
			$('#pw2_check').css('color', 'red');
			change2 = false;
		}else if($('#pw2').val() == '') {
			change2 = false;
		}else {
			$('#pw2_check').text('');
			change2 = true;
		}

		if (change1 && change2) {
			$('#change').prop('disabled', false);
			$('#change').css('background-color', "#ccc");
		} else {
			$('#change').prop('disabled', true);
			$('#change').css('background-color', "#eee");
		}

	});

	$("#pw2").on("propertychange change keyup paste input", function(e) {
		if ($('#pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
			change2 = false;
		} else {
			$('#pw2_check').text('');
			change2 = true;
		}

		if (change1 && change2) {
			$('#change').prop('disabled', false);
			$('#change').css('background-color', "#ccc");
		} else {
			$('#change').prop('disabled', true);
			$('#change').css('background-color', "#eee");
		}

	});


});

function changePw() {
	var list = {
		phone: phone,
		pw: document.getElementById('pw').value
	};

	$.ajax({
		async: false,
		type: 'POST',
		data: JSON.stringify(list),
		url: "/changePw.do",
		contentType: "application/json;charset=UTF-8",
		success: function(data) {
			alert("비밀번호가 변경 되었습니다.");
			location.href = '/shoeger/member/login';
		},
	});
}