<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script>


$(function check(){
	var msg = "${mainData.msg}"
	if(msg=="�ǸŽ�û�� �����Ͻðڽ��ϱ�?"){
		if(confirm(msg)==true){
			sfrm.submit();
		}else{
			
			location.href="sellrequest"
		}
	}else{
		
		if(confirm(msg)==true){
			sfrm.submit();
		}else{
			location.href="sellrequest"
		}
	}
	
})

</script>

<form action="sellregcomp" name="sfrm">
	<input type="hidden" name="pid" value="${mainData.poDTO.pid }" />
	<input type="hidden" name="model" value="${mainData.poDTO.model }" />
	<input type="hidden" name="psize" value="${mainData.poDTO.psize }" />

</form>