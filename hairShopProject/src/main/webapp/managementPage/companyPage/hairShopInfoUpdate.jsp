<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
	if('${su }' == 1)
		alert("정보 수정 완료");		
	else
		alert("정보 수정 실패");
	location.href = "/hairShopProject/adminPage/eventManagement.do";
</script>