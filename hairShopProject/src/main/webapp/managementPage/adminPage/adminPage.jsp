<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/adminPage.css">

<div class="myPage" style="height: auto;">
	<div class="myPage_menu">
		<ul class="myPage_menu_ul">
			<li class="myPage_menu_li"><a href="/hairShopProject/managementPage/adminPage.do">헤어샵 관리</a></li>
			<li class="myPage_menu_li"><a href="/hairShopProject/adminPage/memberManagement.do">회원 관리</a></li>
			<li class="myPage_menu_li"><a href="/hairShopProject/adminPage/reservationManagement.do">예약 관리</a></li>
			<li class="myPage_menu_li"><a href="/hairShopProject/adminPage/eventManagement.do">이벤트 관리</a></li>
		</ul>
	</div>
	
	<div class="myPage_body">
		<jsp:include page="${myPageBody }" />
	</div>
</div>