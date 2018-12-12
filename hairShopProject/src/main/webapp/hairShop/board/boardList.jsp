<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" type="text/css" href="/hairShopProject/hairShop/css/qnapop.css">
<style>
	div.list_sub table tr{
	border : 1px solid black;
	height : 10px;
	}
	th{
		text-align : center;
	}
	div #boardPagingDiv{
		display:inline;
	}
</style>

<!-- 리스트 목록 -->

<input type="hidden" id="pg" value="${pg }" />
<input type="hidden" id="emailCheck" value="0" />

<input type="hidden" id="searchOptionVal" value="${searchOption }" />
<input type="hidden" id="keywordVal" value="${keyword }" />

<div id="boardView_div" class="list_sub">
<table id="boardListTable" cellpadding="5" frame="hsides" rules="rows">
	<thead>
		<tr id="addView" align="center">
			<th width="100">글번호</th>
			<th width="320">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
		</tr>
	</thead>
	<tbody class="tbodyList" width="auto" height="auto">
		<div id="listView"></div>
	</tbody>	
</table>
<nav aria-label='...'>
	<div id="boardPagingDiv"></div>
</nav>
</div>
<br>
<!-- 검색 부분 -->
<div style="width: 750px; text-align: center;">
	<select id="searchOption">
		<option value="subject">제목</option>
		<option value="email">작성자</option>
	</select>
	<input type="text" id="keyword" width="30px">
	<input type="button" value="검색" id="searchBtn">
	<!-- 글쓰기 버튼 -->
	<div style="float: right; text-align: center;" id="qnawriteDiv">
	</div>
</div>



<!-- 공지사항 팝업창 시작-->
<div id="qnaWriteForm" class="qnamopdel">
      <!-- Modal content -->
     <div class="qnamopdel-content">
       <span id="closeQNA">&times;</span>
       <p style="font-size:25px; color:black;">공지 작성</p>
       <form name="boardWriteForm" id="boardWriteForm" method="post" action="/hairShopProject/hairShop/board/boardWrite.do">
       <table class="qnatable">
	       <tr>
		       <td>제목</td>
		       <td>
		       	<input type="text" name="subject" id="subject" class="qna100" placeholder="제목입력">
		       	<div id="subjectDiv"></div>
		       </td>
	       </tr>
	       <tr>
		       <td class="contentVerticalAlign" style="vertical-align: top;">내용</td>
		       <td>
		       <textarea id="content" name="content" class="qna200" style="resize:none; height:200px;" placeholder="작성할 글 입력"></textarea>
		       <div id="contentDiv"></div>
		       </td>
	       </tr>
	       <tr>
		        <td colspan="2" align="center">
		        <br>
				<!-- <button id="boardWriteBtn" class="qnaButton" style="text-align:center;">작성 완료</button>&emsp; -->
				<input type="button" class="qnaButton" id="boardWriteBtn" value="공지 등록" />&emsp;
				<input type="reset" class="qnaButton" value="다시작성"/>
				<br>
				</td>
	       </tr>
       </table>
       </form>
     </div>
</div>
<!-- 공지사항 팝업창 끝 -->


<!-- 수정하기 팝업창  시작-->
<div id="qnaModifyForm" class="qnamopdel">
      <!-- Modal content -->
     <div class="qnamopdel-content">
       <span id="closeQNA">&times;</span>
       <p style="font-size:25px; color:black;">공지 수정</p>
       <form name="boardModifyForm" id="boardModifyForm" method="post" action="board/boardModify.do">
       <input type="hidden" name="seq" class="hiddenSeq">
       <table class="qnatable" style="vertical-align:middle;">
	       <tr>
		       <td>제목</td>
		       <td>
		       	<input type="text" class="qna100" id="subject2" placeholder="제목 입력" value=""/>
		       	<div id="subjectDiv2"></div>
		       </td>
	       </tr>
	       <tr  style="vertical-align:middle;">
		       <td class="contentVerticalAlign" >내용</td>
		       <td>
		       <textarea class="qna200" placeholder="내용 입력" id="content2" style="resize:none; height:200px;"></textarea>
		       <div id="contentDiv2"></div>
		       </td>
	       </tr>
	       <tr>
		        <td colspan="2" align="center"><br>
					<input type="button" class="qnaButton" id="boardModifyBtn" value="수정 하기"/>&emsp;
				</td> 
	       </tr>
       </table>
       </form>
     </div>
</div>
<!-- 수정하기 팝업창  끝-->


<script type="text/javascript" src="/hairShopProject/hairShop/js/board.js">
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function deleteT(seq){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/board/boardDelete.do',
		data : {'seq' : seq},
		success : function(){
			alert('삭제완료');
			location.reload();
		}
	});
}

function modifyT(seq){
	var modal2 =  document.getElementById("qnaModifyForm");
	var btn2 = document.getElementById("qnaModifyBtn");
	$('table#boardListTable').on('click','#qnaModifyBtn',function(){
		modal2.style.display = "block";
	});
	
	document.boardModifyForm.seq.value = seq;
	
	 $('div span#closeQNA').on('click',function(){
	      modal2.style.display = "none";
	 });
	 window.onclick = function(event) {
	      if (event.target == modal2) {
	          modal2.style.display = "none";
	      }
	 }
	 $.ajax({
			type : 'POST',
			url : '/hairShopProject/hairShop/board/boardModifyForm.do',
			data : {'seq': seq},
			dataType : 'json',
			success : function(data){
				$('#subject2').val(data.boardDTO.subject);
				$('#content2').text(data.boardDTO.content);
			},
			error : function(){
				alert('ajax 에러');
			}
		 });
}

$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/board/isCheckId.do',
		data : {'hairShopId' : '${hairShopId }'},
		dataType : 'json',
		success : function(data){
			if(data.isCheckId == 1) {
				$('#emailCheck').val("1");
				//alert($('input#emailCheck').val());

				$('div#qnawriteDiv').html('<button type="button" id="qnawriteBtn" class="qnaButton">공지 작성</button>');
			};
		}
	});
	var modal =  document.getElementById("qnaWriteForm");
    $(document).on('click','button#qnawriteBtn',function(){
        modal.style.display = "block";
    });
  	$('#closeQNA').on('click',function(){
        modal.style.display = "none";
   	});
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
});
</script>