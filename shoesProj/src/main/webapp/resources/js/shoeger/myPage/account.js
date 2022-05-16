$(function() {
	$("#modify").click(function() {
		frm.action = "modifyRegaccount"
		frm.submit()
	})
	$('#account').change(function(){
		if($(this).val() != '' && $('#accountnum').val() != '' && $('#accountname').val() != ''){
			$("#modify").attr("disabled",false )
		}else{
			$("#modify").attr("disabled","disabled" )
		}
	})

	$('#accountnum').keyup(function(){
		if($(this).val() != '' && $('#account').val() != '' && $('#accountname').val() != ''){
			$("#modify").attr("disabled",false )
			
		}else{
			$("#modify").attr("disabled","disabled" )
		}
	})
	$('#accountname').keyup(function(){
		if($(this).val() != '' && $('#account').val() != '' && $('#accountnum').val() != ''){
			$("#modify").attr("disabled",false )
			
		}else{
			$("#modify").attr("disabled","disabled" )
		}
	})
	
	  $("#accountname").on("propertychange change keyup paste input", function() {
      var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
         $(this).val($(this).val().replace(regexp,''));
   })
   $("#accountnum").on("propertychange change keyup paste input", function() {
      var regexp = /[^0-9]/gi;
         $(this).val($(this).val().replace(regexp,''));
   })
	
	
})