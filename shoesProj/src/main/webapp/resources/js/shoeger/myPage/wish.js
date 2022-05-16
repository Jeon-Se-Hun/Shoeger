$(function() {
	$(".modify").click(function() {
		$("#numdata").val($(this).attr("nn"))
		frm.action = "modifyRegwish"
		frm.submit()
	})
})