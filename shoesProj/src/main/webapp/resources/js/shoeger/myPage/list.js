$(function() {
	$(".btn").click(function() {
		$("#pageIN").val($(this).attr("dd"))
		frm.submit()
	})
})