$(document).ready(function(){
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
	
	
	//답글쓰기
	$('#boardReplyBtn').click(function(){
		var subject = $('#subject').val();
		var content = $('#content').val();
		
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if(subject.length==0){			
			$('#subjectDiv').html('<span style="color:red;font-size:8pt">제목을 입력하세요</span>')
		}else if(content.length==0){
			$('#contentDiv').html('<span style="color:red;font-size:8pt">내용을 입력하세요</span>')
		}else
			$('#boardReplyForm').submit();
	});
	
	
	//검색
	$('#searchBtn').on('click',function(){
		var searchOption = $('#searchOption').val();
		var keyword = encodeURIComponent($('#keyword').val(),"UTF-8");
		var pg = $('#pg').val();
		//alert(keyword);

		if(keyword.length==0)
			alert("검색어를 입력해주세요");
		else
			location.href='boardSearch.do?searchOption='+searchOption+'&keyword='+keyword+"&pg="+pg;     
	});
	
	//글수정
	$('#boardModifyBtn').click(function(){
		var subject = $('#subject').val();
		var content = $('#content').val();
		
		$('#subjectDiv').empty();
		$('#contentDiv').empty();
		
		if(subject.length==0)			
			$('#subjectDiv').html('<span style="color:red;font-size:8pt">제목을 입력하세요</span>')
		
		else if(content.length==0)
			$('#contentDiv').html('<span style="color:red;font-size:8pt">내용을 입력하세요</span>')
		
		else
			$('#boardModifyForm').submit();
	
	});
});