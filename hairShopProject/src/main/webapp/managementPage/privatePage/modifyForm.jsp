<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/privatePage/css/memberPage.css">

<div id="modifyFormDiv" style="overflow-x:hidden; height: 100%; ">
<h3 align="center">회원정보수정</h3><br><br>
<form name="modifyForm" class="modifyForm" method="post" action="modify.do">
<table class="modifyTable">
	<tr>
		<td align="center">이메일</td>
		<td>
			<input type="text" class="modifyEmail" size="30" value="${memberDTO.email }" readonly>
		</td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td>
			<input type="text" class="modifyName" size="20" value="${memberDTO.name }">
			<div class="checkModifyNameDiv"></div>
		</td>
	</tr>
  	<tr>
	   <td align="center">비밀번호</td>
	   <td>
		   	<input type="password" class="modifyPwd" size="30">
		    <div class="checkModifyPwdDiv"></div>
	   </td>
  	</tr>
  	<tr>
   		<td align="center">재확인</td>
	   	<td>
		    <input type="password" class="modifyRePwd" size="30">
		    <div class="checkModifyRePwdDiv"></div>
	   	</td>
  	</tr>
	<tr>
		<td align="center">핸드폰</td>
		<td>
			<input type="text" class="modifyTel1" size="5" value="${memberDTO.tel1 }">&nbsp;-
			<input type="text" class="modifyTel2" size="5" value="${memberDTO.tel2 }">&nbsp;-
			<input type="text" class="modifyTel3" size="5" value="${memberDTO.tel3 }">
			<div class="checkModifyTelDiv"></div>
		</td>
	</tr>
	<tr>
		<td align="center">주소</td>
		<td>
			<input type="text" id="zipcode" size="10" value="${memberDTO.zipcode }" readonly>
			<input type="button" value="우편번호검색" class="checkPostBtn"><br>
			<input type="text" id="addr1" size="50" value="${memberDTO.addr1 }" readonly><br>
			<input type="text" id="addr2" size="50" value="${memberDTO.addr2 }">
			<div class="checkAddr2Div"></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" class="modifyBtn" value="회원정보수정">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
</div>
<script src="/hairShopProject/managementPage/privatePage/js/memberPage.js"></script>