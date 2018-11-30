<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
div .btnset{
	align : center;
}
table tr.title td.titleS{
	background-color: #FFF0F0;
}
</style>

<form name="boardViewForm">
<input type="hidden" id="view_seq" name="seq" value="${param.seq }">
<input type="hidden" name="pg" value="${param.pg }">

<table cellpadding="5" frame="hsides" rules="rows" width="720px">
<tr class="title">
	<td height="50px" class="titleS" style="align :center; font-size: 25px" colspan="3"><span id="subject_view"></span></td>
</tr>

<tr>
   	<td width="150" align="center">글번호 : <span id="seq_view"></span></td>
   	<td width="150" align="center">작성자 : <span id="email_view"></span></td>
   	<td width="150" align="center">작성일 : <span id="logtime_view"></span></td>
</tr>

<tr>
	<td height="250" colspan="3" valign="top" style="text-align :left; font-size: 18px;"><span id="content_view"></span></td>
</tr>
</table>
<br>
<div class="btnset">
<c:if test="${boardDTO.id==memId}"><!-- 사업자 회원일시에 -->
	<input type="button" value="답글"
	onclick="location.href='boardReplyForm.do?pseq=${boardDTO.seq }&pg=${pg }'">&emsp;
</c:if>
<input type="button" value="목록" onclick="location.href='/hairShopProject/hairShop/hairShop_index.do?hairShopId=juno'">&emsp;
<c:if test="${boardDTO.id==memId}"> <!-- 개인 회원일시에 -->
	<input type="button" value="글수정" onclick="mode(1)">&emsp;
	<input type="button" value="글삭제" onclick="mode(2)">
</c:if>
</div>
<br><br>
<script type="text/javascript">
$(document).ready(function(){
	var seq = document.getElementById('view_seq').value;
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/board/boardView.do',
		data : {'seq': seq , 'pg' : "1"},
		dataType : 'json',
		success : function(data){
			$('span#subject_view').text(data.boardDTO.subject);
			$('span#seq_view').text(data.boardDTO.seq);
			$('span#email_view').text(data.boardDTO.email);
			$('span#logtime_view').text(data.boardDTO.logtime);
			$('span#content_view').text(data.boardDTO.content);
		},
		error: function(){alert("error");}
	});
});
function mode(num){
	if(num==1){
		document.boardViewForm.method="post";
		document.boardViewForm.action="boardModifyForm.do";
		document.boardViewForm.submit();
	}else if(num==2){
		document.boardViewForm.method="post";
		document.boardViewForm.action="boardDelete.do";
		document.boardViewForm.submit();
	}
}
</script>
</form>