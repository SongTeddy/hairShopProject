//리스트 페이징
function boardList(){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/board/getBoardList.do',
		data : {'pg':$('#pg').val()},
		dataType : 'json',
		success : function(data){
			$('table tbody.tbodyList').empty();
			$.each(data.list, function(index, items){
				/* alert("ajax index"+index); */
				$('<tr/>',{
					class : 'tr'+items.seq 
				}).append($('<td/>',{
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
				})).appendTo($('table tbody.tbodyList'));
			});
			$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
		}
	});
}


$(document).ready(function(){
	
	//목록
	boardList();
	
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
						})).appendTo($('#boardListTable'));                            
					});
					$('#boardPagingDiv').html(data.boardPaging.pagingHTML);
				}
			});
		}
	});
    
    //게시물 제목 클릭시(View)
	$('table tbody.tbodyList').on('click','a.subjectA',function(){
		
		$('#boardListTable .subjectA').addClass('on');
		$(this).removeClass('on');
		var seq = $(this).parent().prev().text();
		var show = $('#showViewArticle').val();
		alert($('#emailCheck').val());
		$.ajax({
			type: 'POST',
			url: '/hairShopProject/hairShop/board/boardView.do',
			data: {'seq': seq},
			dataType : 'json',
			success: function(data){
				if(document.getElementsByClassName('viewTr').length > 0) {
					$('tr.viewTr').remove();
				}
				
				if($('#emailCheck').val()=='1') {
					$('tr.tr'+seq).after($('<tr/>',{
						class : 'viewTr'
					}).append($('<td/>',{
						colspan : '4',
						html : '<br>'+
						'<span>'+data.boardDTO.content+'</span>'+
						'<br>'+
						'<div style="float:right;"><input type="button" class="qnaButton" value="삭제" onclick="deleteT('+seq+')"/></div>'+
						'<div style="float:right;"><input type="button" class="qnaButton" value="수정" id="qnaModifyBtn" onclick="modifyT('+seq+')" /></div>'
					})));
				} else {
					$('tr.tr'+seq).after($('<tr/>',{
						class : 'viewTr'
					}).append($('<td/>',{
						colspan : '4',
						html : '<br>'+
						'<span>'+data.boardDTO.content+'</span>'
					})));
				}
			},
			error: function(){alert("error");}
		});
	});
    
	
	
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
		else{
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/board/boardWrite.do',
				data : {'subject' : subject, 'content' : content},
				success : function(data){
					window.location.reload(true);
				}
			});
		}
	});
	
	
	$('.subjectA').on('click',function(){
		var seq = $(this).parent().prev().text();
		var pg = $('#pg').val();
		
		location.href="boardView.do?seq="+seq+"&pg="+pg;
	});
	
	
	//글수정
	$('#boardModifyBtn').click(function(){
		var subject = $('#subject2').val();
		var content = $('#content2').val();
		var seq = $('.hiddenSeq').val();/*.text();*/

		$('#subjectDiv2').empty();
		$('#contentDiv2').empty();
		
		if(subject.length==0)			
			$('#subjectDiv2').html('<span style="color:red;font-size:8pt">제목을 입력하세요</span>')
		
		else if(content.length==0)
			$('#contentDiv2').html('<span style="color:red;font-size:8pt">내용을 입력하세요</span>')
		
		else
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/hairShop/board/boardModify.do',
				data : {'seq' : seq, 'subject' : subject, 'content' : content},
				success : function(data){
					window.location.reload(true);
				}
			});
	});
	

});