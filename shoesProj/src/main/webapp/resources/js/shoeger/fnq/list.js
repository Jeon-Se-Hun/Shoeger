$(function() {
	$(".btn").click(function() {
		$("#pageIN").val($(this).attr("dd"))
		frm.submit()
	})

	$("#schBtn").click(function() {
		$("#pageIN").val("1");
		$("#sch").val($("#sch1").val());
		$("#kind").val($("#kind1").val());
		frm.submit()
	});
})