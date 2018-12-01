<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- <link rel="stylesheet" href="/hairShopProject/managementPage/css/bootstrap.css">
<link rel="stylesheet" href="/hairShopProject/managementPage/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="/hairShopProject/managementPage/css/memberPage.css">

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
<input type="hidden" class="modifyFormEmail" value="#{memEmail }">
<script src="js/memberPage.js"></script>
<!-- <script src="js/bootstrap.js"></script>
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="js/bootstrap.min.js"></script> -->
<script>
$(document).ready(function(){
	$('table td:last').css("background","white").css("font-weight","initial");
	
	$('.modifyName, .modifyPwd, .modifyRePwd, .modifyTel1, .modifyTel2, .modifyTel3, #addr2').on('click',function(){
		$('.checkNameDiv, .checkPwdDiv, .checkRePwdDiv, .checkTelDiv, .checkAddr2Div').empty();
	});
	
	$('.checkRePwdDiv').keyup('change',function(){
		if($('.modifyPwd').val() == $('.modifyRePwd').val())
			$('.checkRePwdDiv').text('비밀번호가 동일합니다.').css('color','blue').css('font-size','9pt');
		else
			$('.checkRePwdDiv').text('비밀번호가 맞지 않습니다.').css('color','red').css('font-size','9pt');
	});
	
	$('.modifyBtn').on('click',function(){
		if($('.modifyName').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '이름을 입력해 주세요.'
			}).appendTo($('.checkModifyNameDiv'));
		} else if($('.modifyPwd').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '비밀번호를 입력해 주세요.'
			}).appendTo($('.checkModifyPwdDiv'));
		} else if($('.modifyRePwd').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '비밀번호를 재입력해 주세요.'
			}).appendTo($('.checkModifyRePwdDiv'));
			
		} else if($('.modifyRePwd').val()!=$('.modifyPwd').val()) {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '비밀번호가 맞지 않습니다.'
			}).appendTo($('.checkModifyRePwdDiv'));
		} else if($('.modifyTel1').val()=="" || $('.modifyTel2').val()=="" || $('.modifyTel3').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '나머지번호를 입력해 주세요.'
			}).appendTo($('.checkModifyTelDiv'));
		} else if($('#addr2').val()=="") {
			$('<span/>',{
				style : 'color:red; font-weight:bold; font-size:9pt;',
				text : '상세주소를 입력해주세요.'
			}).appendTo($('.checkAddr2Div'));
		}else {
			$.ajax({
				type : 'POST',
				url : '../managementPage/modify.do',
				data :  {'email':$('.modifyEmail').val(), 'name':$('.modifyName').val(), 'pwd':$('.modifyPwd').val(), 'tel1':$('.modifyTel1').val(), 'tel2':$('.modifyTel2').val(), 'tel3':$('.modifyTel3').val(), 'zipcode':$('#zipcode').val(), 'addr1':$('#addr1').val(), 'addr2':$('#addr2').val()},
				dataType : 'text',
				success : function(data){
					if(data=="success"){
						alert("회원님의 정보를 수정하였습니다.");
						location.href="../managementPage/memberPage.do";
					}
				}
			});
		}
	});
});
</script>