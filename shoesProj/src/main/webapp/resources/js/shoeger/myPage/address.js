$(function() {
   $("#modify").click(
      function() {
         $("#realaddress").val(
            '(' + $("#mem_oaddress").val() + ') '
            + $("#mem_address").val() + ' '
            + $("#addressDetail").val());
         frm.action = "modifyRegaddress"
         frm.submit()
      })
      
   $('#address2').change(function(){
      if($(this).val() != '' && $('#address3').val() != '' && $('#addressDetail').val() != '' && $('#mem_address').val() != ''){
         $("#modify").attr("disabled",false )
      }else{
         $("#modify").attr("disabled","disabled" )
      }
   })

   $('#address3').keyup(function(){
      if($(this).val() != '' && $('#address2').val() != '' && $('#addressDetail').val() != '' && $('#mem_address').val() != ''){
         $("#modify").attr("disabled",false )
         
      }else{
         $("#modify").attr("disabled","disabled" )
      }
   })
   $('#addressDetail').keyup(function(){
      if($(this).val() != '' && $('#address3').val() != '' && $('#address2').val() != '' && $('#mem_address').val() != ''){
         $("#modify").attr("disabled",false )
         
      }else{
         $("#modify").attr("disabled","disabled" )
      }
   })
   
   $('#mem_address').change(function(){
      if($(this).val() != '' && $('#address3').val() != '' && $('#addressDetail').val() != '' && $('#address2').val() != ''){
         $("#modify").attr("disabled",false )
      }else{
         $("#modify").attr("disabled","disabled" )
      }
   })
   
   
   $("#address2").on("propertychange change keyup paste input", function() {
        var regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
          $(this).val($(this).val().replace(regexp,''));
   })
   $("#address3").on("propertychange change keyup paste input", function() {
      var regexp = /[^0-9-]/gi;
         $(this).val($(this).val().replace(regexp,''));
   })
      
})
//우편번호 찾기 버튼 클릭시 발생 이벤트 
function execPostCode() {
   new daum.Postcode({
      oncomplete: function(data) {
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
         
         
         if($("#mem_address").val() != '' && $('#address3').val() != '' && $('#addressDetail').val() != '' && $('#address2').val() != ''){
            $("#modify").attr("disabled",false )
         }else{
            $("#modify").attr("disabled","disabled" )
         }
      }
   }).open();
}