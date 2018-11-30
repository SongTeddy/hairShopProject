<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	div.list_sub table tr{
	border : 1px solid black;
	height : 10px;
	}
	th{
		text-align : center;
		style=""
	}
</style>
<input type="hidden" id="pg" value="${param.pg}" />

<div id="boardView_div" class="list_sub">
<table id="boardListTable" cellpadding="5" frame="hsides" rules="rows">
	<thead>
		<tr align="center">
			<th width="100">글번호</th>
			<th width="320">제목</th>
			<th width="150">작성자</th>
			<th width="150">작성일</th>
		</tr>
	</thead>
</table>
<div id="boardPagingDiv" style="float: left; width: 700px; text-align: center;">
</div>

<br><br><br>
<div style="width: 750px; text-align: center;">
	<select id="searchOption">
		<option value="subject">제목</option>
		<option value="email">작성자</option>
	</select>
	<input type="text" id="keyword" width="30px">
	<input type="button" value="검색" id="searchBtn">
	<!-- 글쓰기 버튼 -->
	<div style="float: right; text-align: center;">
		<c:if test="${memEmail==null}">
			<input type="button" id="qwriteBtn" value="글쓰기">
			<!-- <a id="qwriteBtn" style="color:black; font-family:한컴 윤체 L; text-decoration:none">글쓰기</a> -->
		</c:if>
	</div>
</div>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
function boardSearch(pg){
	$('#pg').val(pg);
	$('#searchBtn').trigger('click','trigger');
}
</script>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
        $('#userTable').dataTable({
            pageLength: 3,
            bPaginate: true,
            bLengthChange: true,
            lengthMenu : [ [ 5, 10, 15, -1 ], [ 5, 10, 15, "All" ] ],
            bAutoWidth: false,
            processing: true,
            ordering: true,
            serverSide: false,
            searching: true,
            ajax : {
                "url":"/getUserList.do",
                "type":"POST",
                "data": function (d) {
                    d.userStatCd = "NR";
                }
            },
            columns : [
                {data: "email"},
                {data: "fullNmKr"},
                {data: "userStatCd"},
                {data: "superUser"}
            ]
        });
});
</script>
<script type="text/javascript">
$(document).ready(function(){
	//목록
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/board/getBoardList.do',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				/* alert("ajax index"+index); */
				$('<tr/>').append($('<td/>',{
					align : 'center',
					text : items.seq
				})).append($('<td/>',{
					}).append($('<a/>',{
						class : 'subjectA '+items.seq,
						href : 'javascript:void(0)',
						text : items.subject
					})
				)).append($('<td/>',{
					align : 'center',
					text : items.email
				})).append($('<td/>',{
					align : 'center',
					text : items.logtime
				})).appendTo($('#boardListTable'));

				//답글 이미지
				if(items.pseq!=0){
					for(i=1; i<=items.lev; i++){
						$('.'+items.seq).before('&emsp;')
					}
					$('.'+items.seq).before($('<img/>',{
						src : '../img/reply.gif'
					}));
				}
			});
			$('#boardPagingDiv').html(data.boardPaging.makeSearchPagingHTML);
		}
	});
	
	
	
	//검색
	$('#searchBtn').click(function(event, str){
		if(str!='trigger')
			$('#pg').val(1);
		if($('#keyword').val()=="")
			alert("검색어를 입력하세요");
		else{
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/board/boardSearch.do',
				data : {
					'pg':$('#pg').val(),
					'searchOption': $('#searchOption').val(),
					'keyword': $('#keyword').val()
				},
				dataType : 'json',
				success : function(data){
					$('#boardListTable tr:gt(0)').remove();
					$.each(data.list, function(index, items){
						$('<tr/>').append($('<td/>',{
							align : 'center',
							text : items.seq
						})).append($('<td/>',{
							}).append($('<a/>',{
								class : 'subjectA',
								href : 'javascript:void(0)',
								text : items.subject
							})
						)).append($('<td/>',{
							align : 'center',
							text : items.email
						})).append($('<td/>',{
							align : 'center',
							text : items.logtime
						})).append($('<td/>',{
							align : 'center',
							text : items.hit
						})).appendTo($('#boardListTable'));                            
					});
					$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				}
			});
		}
	});
	
	
	
	
	
	/* //로그인 여부
	$('#boardListTable').on('click', '.subjectA', function(){
		if('${memEmail}'=='')
			alert("로그인이 필요합니다.");
		else{
			var seq = $(this).parent().prev().text();
			location.href="/hairShopProject/board/boardView.do?seq="+seq+"&pg=1";
		}
	}); */
	
	$('#boardListTable').on('click', '.subjectA', function(){
		var seq = $(this).parent().prev().text();
		$('#boardView_div').empty();
		$('#boardView_div').load("board/boardView.jsp?seq="+seq);
	});
	
	$('#qwriteBtn').on('click',function(){
		$('#boardView_div').empty();
		$('#boardView_div').load("board/boardWriteForm.jsp");
	});
	
});
</script>
