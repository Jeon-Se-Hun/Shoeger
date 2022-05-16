<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다. 
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
				fullRoadAddr = data.roadAddress;
				// 도로명 주소 변수 
				extraRoadAddr = '';
				// 도로명 조합형 주소 변수 
				// 법정동명이 있을 경우 추가한다. (법정리는 제외) // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다. 
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다. 
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
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
				$('#detailaddress')
			}
		}).open();
	}

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	$(function() {
		var phoneChk = /^\d{3}-\d{3,4}-\d{4}$/;
		var pidChk = true;
		var phoChk = true;

		$("#pname").on("propertychange change keyup paste input", function() {
			var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
			$(this).val($(this).val().replace(regexp, ''));
		})

		$("#pid").on("propertychange change keyup paste input", function() {
			var regexp = /[^0-9]/gi
			var ppp = $(this).val()
			$(this).val(ppp.replace(regexp, ''));

			if (ppp.length == 10) {
				pidChk = checkBisNo(ppp)
				
			} else {
				pidChk = false;
			}
		});

		function checkBisNo(bisNo) {
			if ((bisNo = (bisNo + '').match(/\d{1}/g)).length != 10) {
				return false;
			}
			var sum = 0, key = [ 1, 3, 7, 1, 3, 7, 1, 3, 5 ];
			for (var i = 0; i < 9; i++) {
				sum += (key[i] * Number(bisNo[i]));
			}
			return (10 - ((sum + Math.floor(key[8] * Number(bisNo[8]) / 10)) % 10)) == Number(bisNo[9]);
		}

		$("#phone").on("propertychange change keyup paste input", function(e) {
			if (phoneChk.test($(this).val())) {
				phoChk = true;
			} else {
				phoChk = false;
			}
		});
		$('#btnModi').click(function() {
			if (!pidChk) {
				alert("사업자 등록번호를 확인 해주세요.");
				return;
			}else {
				$('#pid').val($('#pid').val().replace(/(\d{3})(\d{2})(\d{5})/,'$1-$2-$3'));
			}

			if (!phoChk) {
				alert("휴대폰 번호를 확인 해주세요.");
				return;
			}
			frm.submit();
		});
	});
</script>
<div id="showStatus">

	<h3>기본정보설정</h3>

	<h4>관리자 정보</h4>
	<form action="${csData.service }Reg" method="post" name="frm"
		enctype="Multipart/form-data">
		<div id="table1">
			<div class="left">
				<div class="title">사업자등록번호</div>
				<div class="information">
					<input type="text" name="pid" value="${mainData.ssDTO.pid }"
						id="pid" maxlength="12" />
				</div>
				<div class="title">상호</div>
				<div class="information">
					<input type="text" name="maddress"
						value="${mainData.ssDTO.maddress }" />
				</div>
				<div class="title">대표자명</div>
				<div class="information">
					<input type="text" name="pname" value="${mainData.ssDTO.pname }"
						id="pname" />
				</div>
			</div>

			<div class="right">
				<div class="title">인감</div>
				<div class="information">
					<input class="btn" name="file" type="file" value="파일선택"
						onchange="readURL(this);" /> <img id="blah"
						src='<c:url value="/resources/fff/${mainData.ssDTO.card }" />' />
				</div>
			</div>

			<div class="middle">
				<div class="title">주소</div>
				<div class="information">
					<input class="adress" name="address1" id="mem_oaddress" type="text"
						value="${mainData.ssDTO.address1 }" readonly="readonly" /> <input
						class="btn" type="button" onclick="execPostCode();"
						value="우편번호 통합검색" /> <input class="adress" name="address2"
						id="mem_address" type="text" value="${mainData.ssDTO.address2 }"
						readonly="readonly" /> <input class="adress" name="address3"
						id="addressDetail" type="text" value="${mainData.ssDTO.address3 }" />
					<input class="address1" type="hidden" />
				</div>
			</div>

			<div class="buttom">
				<div class="title">전화번호</div>
				<div class="information">
					<input type="text" name="phone" value="${mainData.ssDTO.phone }"
						id="phone" />
				</div>
				<div class="title">팩스번호</div>
				<div class="information">
					<input type="text" name="email" value="${mainData.ssDTO.email }" />
				</div>
			</div>
		</div>
		<input class="btn" type="button" value="변경" id="btnModi" />
	</form>
</div>

