<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="../css/member.css">
</head>
<body>
<form name="boardModifyForm" id="boardModifyForm" method="post" action="boardModify.do">
<input type="hidden" name="seq" value="${boardDTO.seq }">
<input type="hidden" name="pg" value="${pg }">

<div class="table_div">
<table cellspacing="0" cellpadding="5">
<tr>
	<td class="table_th">제목</td>
	<td>
		<input type="text" class="w100" name="subject" id="subject" value="${boardDTO.subject }"/>
		<div id="subjectDiv"></div>
	</td>
</tr>
<tr>
	<td class="table_th">내용</td>
	<td>
		<textarea rows="15" class="w100" style="resize:none;" name="content" id="content">${boardDTO.content }</textarea>
		<div id="contentDiv"></div>
	</td>
</tr>
<tr>
	<td colspan="2" class="button_td">
		<input type="button" id="boardModifyBtn" value="글수정" />
		<input type="reset" value="다시작성"/>
	</td>
</tr>
</table>
</div>
</form>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/board.js"></script>