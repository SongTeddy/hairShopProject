<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/css/memberPage.css">
<h3>회원 탈퇴</h3><br><br>
<div class="deleteForm" style="border: 1px solid black;">
	<div class="delete">
		<div class="input-container">
			<strong>이메일 : </strong><input type="text" class="deleteEmail"><br><br>
			<strong>비밀번호 : </strong><input type="password" class="deletePwd">  
		</div><br><br><br>
		<div class="btn-container">
			<input type="button" class="deleteBtn" value="회원탈퇴"/>
			<input type="button" value="취소" onclick="location.href='../managementPage/memberPage.do'"/>
		</div>
	</div>
</div>
<script src="js/memberPage.js"></script>