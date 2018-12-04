<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="/hairShopProject/managementPage/css/companyPage.css">
<form name="memberPageMenuForm" method="post">
<div class="myPage">
	<div class="myPage_menu">
		<ul class="myPage_menu_ul">
		  <li class="myPage_menu_li"><a class="modifyA" href="javascript:void(0)" onclick="modifyForm()">회원정보수정</a></li>
		  <li class="myPage_menu_li"><a href="javascript:void(0)" onclick="heartList()">관심 헤어샵</a></li>
		  <li class="myPage_menu_li"><a href="javascript:void(0)" onclick="reservationForm()">예약 확인</a></li>
		  <li class="myPage_menu_li"><a href="javascript:void(0)" onclick="usageDetailsInformationForm()">이용내역안내</a></li>
		  <li class="myPage_menu_li"><a href="../managementPage/deleteForm.do">회원 탈퇴</a></li>
		</ul>
	</div>
	<div class="myPage_body" align="center">
		<jsp:include page="${memberPage}" />
	</div>
</div>
</form>
<script type="text/javascript">
$(document).ready(function(){
	$('.myPage_menu_li a').on('click',function(){
		$('.myPage_menu_li a').removeClass('myPage_menu_ul_active');
		$(this).addClass('myPage_menu_ul_active');
	});
});
function heartList(){
	location.href = "heartList.do";
}
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