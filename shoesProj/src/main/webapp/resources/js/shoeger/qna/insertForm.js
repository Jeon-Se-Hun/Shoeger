function check_onclick() {
	theForm = document.frm;

	if (theForm.title.value.trim() == "") {
		alert("제목이 비어있습니다. 확인해주세요.")
		theForm.title.focus();

	} else if (theForm.content.value.trim() == "") {
		alert("내용이 비어있습니다. 확인해주세요.")
		theForm.content.focus();

	} else {
		$(function() {
			frm.submit()
		})
	}
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

function checkSize(input) {
	if (input.files && input.files[0].size > (1 * 1024 * 1024)) {
		alert("파일 사이즈가 8mb 를 넘습니다.");
		input.value = null;
	}
}