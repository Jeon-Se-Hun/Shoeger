$(function() {
	$("#del").click(function() {
		if (confirm("회원탈퇴 하시겠습니까??")) {
			frm.action = "modifyRegdelcli"
			frm.submit()
		}
	})	
})