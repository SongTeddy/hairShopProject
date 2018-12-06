<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/privatePage/css/memberPage.css">
<div class="deleteFormDiv">
<font size="6pt" clss="modifyFormTitle" style="color: #363636;">회원 탈퇴</font><br>
<hr align="left" clss="modifyFormTitle" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 145px;
	    	  border-top: 2px solid #5A5A5A;"><br><br><br>
	<table class="deleteTable">
		<tr>
			<td>이메일</td>
			<td>
			<div class="input-container">
				<input type="text" class="deleteEmail" size="58" style="height:35px;">
			</div>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
			<div class="input-container">
				<input type="password" class="deletePwd" size="58" style="height:35px;">
			</div>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="background: #ffffff;">
			<div class="btn-container">
				<input type="button" class="deleteBtn" value="회원탈퇴" style="height:30px; width:100px;"/>&nbsp;
				<input type="button" value="취소" onclick="location.href='../managementPage/memberPage.do'" style="height:30px; width:50px;"/>
			</div>
			</td>
		</tr>
	</table>
</div>
<script src="/hairShopProject/managementPage/privatePage/js/memberPage.js"></script>