<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/adminPage.css">

<div class="myPage" style="background-color: #F9F9F9; height: auto;">
	<div class="myPage_menu">
		<a href="/hairShopProject/managementPage/adminPage.do">헤어샵 관리</a><br><br>
		<a href="/hairShopProject/adminPage/memberManagement.do">회원 관리</a><br><br>
		<a href="/hairShopProject/adminPage/eventManagement.do">이벤트 관리</a><br><br>
	</div>
	
	<div class="myPage_body">
		<jsp:include page="${myPageBody }" />
	</div>
</div>