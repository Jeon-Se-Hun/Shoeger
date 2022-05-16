<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
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

var inval_Arr = new Array(7).fill(false);

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

		if (address == '') {
			inval_Arr[1] = false;
		} else {
			inval_Arr[1] = true;
			address += document.getElementById('address3').value;
			document.getElementById('maddress').value = address;
		}
		//전체 유효성 검사 
		var validAll = true;

		for (var i = 0; i < inval_Arr.length; i++) {
			if (inval_Arr[i] == false) {
				validAll = false;
			}
		}

		if (validAll == true) {
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
		
	  	 if($('#pw2').val() != $(this).val() && $('#pw2').val() != ''){
				$('#pw2_check').text('비밀번호를 다시 확인 해주세요.');
		 		$('#pw2_check').css('color', 'red');
		 		inval_Arr[3] = false;
		} else if ($('#pw2').val() == '') {
			inval_Arr[3] = false;
		} else {
				$('#pw2_check').text('');
				inval_Arr[3] = true;
		}
	});

	$("#pw2").on("propertychange change keyup paste input", function(e) {
		if ($('#pw').val() != $(this).val()) {
			$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
			$('#pw2_check').css('color', 'red');
			inval_Arr[3] = false;
		} else {
			$('#pw2_check').text('');
			inval_Arr[3] = true;
		}
	});
	
	$("#pname").on("propertychange change keyup keypaste input", function(e) {
		var replaceName = /^[가-힣a-zA-Z\s]+$/
  		var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
		$(this).val($(this).val().replace(regexp,'').substr(0,4));
		
	if($(this).val().length >= 2) {
		if($(this).val().match(replaceName)) {
			if (nameChk.test($(this).val())) {
				$("#name_check").text('');
				inval_Arr[4] = true;
			} else {
				$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
				$('#name_check').css('color', 'red');
				inval_Arr[4] = false;
			}
		}else {
			$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
			$('#name_check').css('color', 'red');
			inval_Arr[4] = false;
		}
	}else {
		$('#name_check').text('한글 2~4자 이내로 입력하세요. (특수기호, 공백 사용 불가)');
		$('#name_check').css('color', 'red');
		inval_Arr[4] = false;
	}
	
});
	
	$("#email").on("propertychange change keyup paste input", function(e) {
		if (mailChk.test($(this).val())) {
			$("#email_check").text('');
			inval_Arr[5] = true;
		} else {
			$('#email_check').text('이메일 양식을 확인해주세요.');
			$('#email_check').css('color', 'red');
			inval_Arr[5] = false;
		}
	});
	
	$("#phone").on("propertychange change keyup paste input", function(e) {
		var regexp = /[^0-9-]/gi
			$(this).val($(this).val().replace(regexp, ''));
		if (phoneChk.test($(this).val())) {
			$("#phone_check").text('')
			inval_Arr[6] = true;
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 ');
			$('#phone_check').css('color', 'red');
			inval_Arr[6] = false;
		}
	});

});

function execPostCode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var fullRoadAddr = data.roadAddress;
			var extraRoadAddr = '';
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			}
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			$("[id=address1]").val(data.zonecode);
			$("[id=address2]").val(fullRoadAddr);

			address = '(' + document.getElementById('address1').value + ') ' + document.getElementById('address2').value
				+ ' ';
		}
	}).open();
}
</script>

	<h3>관리자 설정</h3>
	<a href="shopMember">뒤로가기</a>
<div id="wrapper">
	<form action="shopInsertReg" method="post" name="frm">
		<input type="hidden" name="kind" value="관리자">
		<input type="hidden" name="maddress" id="maddress">
		
		<div id="content">
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="box"> 
				<input type="text" name="pid" class="int" maxlength="12" placeholder="영문으로 시작하는 6~12자의 영문, 숫자 조합" id="pid">
				</span>

				<div id="id_check"></div>

			</div>

			<div>
				<h3 class="join_title">
					<label for="pswd1">비밀번호</label>
				</h3>
				<span class="box"> <input type="password" name="pw"
					class="int" maxlength="20" placeholder="숫자,영문(대,소문자),특수문자 조합 최소 8자"
					id="pw">
				</span>
				<div id="pw_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="pswd2">비밀번호 재확인</label>
				</h3>
				<span class="box"> <input type="password" id="pw2"
					class="int" maxlength="20">
				</span>
				<div id="pw2_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="name">이름</label>
				</h3>
				<span class="box"> 
				<input type="text" name="pname" class="int" maxlength="4" id="pname">
				</span>
				<div id="name_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="email">이메일</label>
				</h3>
				<span class="box"> <input type="text" name="email"
					class="int" maxlength="100" id="email">
				</span>
				<div id="email_check"></div>
			</div>

			<div>
				<h3 class="join_title">
					<label for="phoneNo">휴대전화(하이폰 포함 13자리)</label>
				</h3>
				<span class="box int_mobile"> 
				<input type="tel" name="phone" class="int" maxlength="13" placeholder="전화번호 입력" id="phone">
				</span>
				<div id="phone_check"></div>
			</div>

			<h3 class="join_title">
				<label for="address">주소</label>
			</h3>

			<div>
				<input placeholder="우편번호" id="address1" name="address1" type="text" readonly="readonly" class="add">
				<button type="button" onclick="execPostCode();" class="add">우편번호
					찾기</button>
			</div>

			<div>
				<input placeholder="도로명 주소" id="address2" type="text" name="address2" readonly="readonly" class="add" /> 
				<input placeholder="상세주소" id="address3" name="address3" type="text" class="add" />
			</div>

			<div class="btn_area">
				<button type="button" id="btnJoin">
					<span>추가하기</span>
				</button>
			</div>

		</div>
	</form>
</div>
