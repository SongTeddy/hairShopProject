<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/hairShopProject/managementPage/css/companyPage.css">

<div class="myPage" style="background-color: #F3F3F3; height: auto;">
	<div class="myPage_menu">
		<a href="/hairShopProject/managementPage/companyPage.do">예약 현황</a><br><br>
		<a href="/hairShopProject/managementPage/designerMenu.do">디자이너 관리</a><br><br>
		<a href="#">헤어샵 정보 등록 | 수정</a><br><br>
	</div>
	
	<div class="myPage_body">
		<jsp:include page="${myPageBody }" />
	</div>
</div>