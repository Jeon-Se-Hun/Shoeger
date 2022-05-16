$(function() {
	$(".modify").click(function() {
		$("#productid").val($(this).attr("dd"))
		frm.submit()
	})
})