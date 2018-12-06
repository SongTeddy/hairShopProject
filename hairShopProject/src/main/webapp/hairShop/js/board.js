//리스트 페이징
function boardSearch(pg){
	$('#pg').val(pg);
	boardList();
}
function boardList(){
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/hairShop/board/getBoardList.do',
		data : 'pg='+$('#pg').val(),
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

				//답글 이미지
				if(items.pseq!=0){
					for(i=1; i<=items.lev; i++){
						$('.'+items.seq).before('&emsp;')
					}
				}
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
	
	//Q&A질문 작성 팝업창
	$('#boardListTable').on('click', '.subjectA', function(){
		var seq = $(this).parent().prev().text();
	});
    var modal =  document.getElementById("qnaWriteForm");
    var btn = document.getElementById("qnawriteBtn");
    btn.onclick = function() {
        modal.style.display = "block";
    }
   $('#closeQNA').on('click',function(){
        modal.style.display = "none";
   });
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    
    //게시물 제목 클릭시(View)
	$('.tbodyList').on('click','.subjectA',function(){
		$('#boardListTable .subjectA').addClass('on');
		$(this).removeClass('on');
		var seq = $(this).parent().prev().text();
		var pg = $('#pg').val();
		var show = $('#showViewArticle').val();

		$.ajax({
			type: 'POST',
			url: '/hairShopProject/hairShop/board/boardView.do',
			data: {'seq': seq , 'pg' :pg},
			dataType : 'json',
			success: function(data){
				if(document.getElementsByClassName('viewTr').length > 0) {
					$('tr.viewTr').remove();
				}
				$('tr.tr'+seq).after($('<tr/>',{
					class : 'viewTr'
				}).append($('<td/>',{
					colspan : '4',
					html : '<br>'+
						   '<span>'+data.boardDTO.content+'</span>'+
						   '<br>'+
						   '<c:if test=""><div style="float:right;"><input type="button" class="qnaButton" value="삭제" onclick="deleteT('+seq+')"/></div></c:if>'+
						   '<c:if test=""><div style="float:right;"><input type="button" class="qnaButton" value="수정" id="qnaModifyBtn" onclick="modifyT('+seq+')" /></div></c:if>'
				})));
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
		else
			$('#boardWriteForm').submit();
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
		
		$('#subjectDiv2').empty();
		$('#contentDiv2').empty();
		
		if(subject.length==0)			
			$('#subjectDiv2').html('<span style="color:red;font-size:8pt">제목을 입력하세요</span>')
		
		else if(content.length==0)
			$('#contentDiv2').html('<span style="color:red;font-size:8pt">내용을 입력하세요</span>')
		
		else
			$('#boardModifyForm').submit();
	});
	

});