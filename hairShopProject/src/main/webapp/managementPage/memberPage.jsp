<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/hairShopProject/managementPage/css/companyPage.css">
<form name="memberPageMenuForm" method="post">
<div class="myPage">
	<div class="myPage_menu">
		<ul>
			<li><a class="modifyA" href="javascript:void(0)" onclick="modifyForm()">회원정보수정</a><br><br></li>
			<li><a href="javascript:void(0)" onclick="reservationForm()">예약 확인</a><br><br></li>
			<li><a href="javascript:void(0)" onclick="usageDetailsInformationForm()">이용내역안내</a><br><br></li>
			<li><a href="../managementPage/deleteForm.do">회원 탈퇴</a></li>
		</ul>
	</div>

	<div class="myPage_body" align="center">
		<jsp:include page="${memberPage}" />
	</div>
</div>
<input type="hidden" name="memEmail" value="${memEmail}"/>
</form>
<script>
function modifyForm(){
	document.memberPageMenuForm.method="post";
	document.memberPageMenuForm.action="modifyForm.do";
	document.memberPageMenuForm.submit();
}
function usageDetailsInformationForm(){
	document.memberPageMenuForm.method="post";
	document.memberPageMenuForm.action="usageDetailsInformationForm.do";
	document.memberPageMenuForm.submit();
}
function reservationForm(){
	document.memberPageMenuForm.method="post";
	document.memberPageMenuForm.action="reservationForm.do";
	document.memberPageMenuForm.submit();
}
</script>