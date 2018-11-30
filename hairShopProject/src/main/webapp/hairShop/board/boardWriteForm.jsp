<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
table{
	width:750px;
}
.subject_input{
}
table tr td.subject{
	text-align:center;
	align: center;
	background-color: #FFF0F0;
}
table tr td textarea{
}
</style>

<form name="boardWriteForm" id="boardWriteForm" method="post" action="boardWrite.do">

<table cellpadding="3" cellspacing="0" align="center">
<tr>
	<td class="subject">제목</td>
	<td>
		<input class="subject_input" type="text" size="70" name="subject" id="subject" placeholder="제목 입력"/>
		<div id="subjectDiv"></div>
	</td>
</tr>
<tr>
	<td class="contents">내용</td>
	<td>
		<textarea rows="15" cols="70" name="content" id="content" style=" resize:none;" placeholder="내용 입력"></textarea>
		<div id="contentDiv"></div>
	</td>
</tr>
<tr>
	<td colspan="3" class="button_td" align="center">
		<input type="button" id="boardWriteBtn" value="문의 하기" />
		<input type="reset" value="다시작성"/>
		<input type="button" onclick="location.href='/hairShopProject/hairShop/hairShop_index.do?hairShopId=juno'" value="취소" />
	</td>
</tr>
</table>
</form>
<br><br>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
//게시글 작성
	$('#boardWriteBtn').click(function(){
		var subject = $('#subject').val();
		var content = $('#content').val();
		
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if(subject.length==0)			
			$('#subjectDiv').html('<span style="color:red;font-size:8pt">제목을 입력하세요</span>')
		
		else if(content.length==0)
			$('#contentDiv').html('<span style="color:red;font-size:8pt">내용을 입력하세요</span>')
		
		else
			$('#boardWriteForm').submit();
	
	});
	
	$('.subjectA').on('click',function(){
		var seq = $(this).parent().prev().text();
		var pg = $('#pg').val();
		
		location.href="boardView.do?seq="+seq+"&pg="+pg;
	});
	
</script>