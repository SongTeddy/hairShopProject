<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/hairShopProject/managementPage/companyPage/css/stylebookManagement.css">

<font size="6pt" class="modifyFormTitle" style="color: #363636;">스타일 찾기 추가 | 관리</font>
<input type="button" class="btn btn-primary insertModal" value="추가" style="margin: 30px 0px 10px 690px; width:100px; height:50px; font-weight:bold; font-size:13pt;"><br>
<hr align="left" class="modifyFormTitle" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 340px;
	    	  border-top: 2px solid #5A5A5A;"><br>
  	  
<div class="stylebookManagementFormDiv">
</div>
<form name="stylebookManagementInsertForm" id="stylebookManagementInsertForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/companyPage/stylebookManagementInsert.do"> 
	<div id="myStylebookManagementInsertModal" class="stylebookManagementInsertModal">
		<div class="stylebookManagementInsertModal-content">
			<span class="closeStylebookManagementModal">&times;</span>
			<font size="5pt" style="color: #363636; font-weight: bold;">스타일 찾기 추가</font><br>
		<hr	align="left" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 185px;
	    	  border-top: 2px solid #5A5A5A;"><br><br>
	    <div class="input-container" style="color: black;">
	    	<select name="insertService" class="stylebookManagementInsertService">
	    		<option value="">서비스 선택</option>
	    		<option value="커트">커트</option>
	    		<option value="펌">펌</option>
	    		<option value="스타일">스타일</option>
	    		<option value="염색">염색</option>
	    	</select>
	    </div>
		<div class="input-container">
			<span style="font-weight: bold; margin-right: 50px; color:black;">스타일 이름</span>
			<input type="text" name="insertDiscription" class="stylebookManagementInsertDiscription" style="margin-top: 10px; color: black;" size="34" placeholder="상세 스타일 이름 입력">
			<div class="stylebookManagementInsertDiscriptionInsertDiv" align="center"></div>
		</div><br><br>
		<div class="input-container">
			<span style="font-weight: bold; margin-right: 50px; color:black; clear:both;">이미지</span>
			<input type="file" name="insertImage" class="stylebookManagementInsertImage" style="margin-top: 10px; color: black;" size="30" placeholder="헤어 이미지 등록">
			<div class="stylebookManagementInsertImageDiv" align="center"></div>
		</div>
		<hr	align="left" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 535px;
	    	  border-top: 1px solid #5A5A5A;">
		<div class="button-container" align="center">
			<input type="button" class="stylebookManagementInsertBtn" style="width: 80px; margin-right: 10px; color:black;" value="작성">
			<input type="reset" style="width: 80px; color:black;" value="다시 작성">
			</div>
		</div>
	</div>
	<input type="hidden" name="hairshopId" class="stylebookManagement-hairshopId" value="${hairShopId }">
</form>
<form name="stylebookManagementModifyForm" id="stylebookManagementModifyForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/companyPage/staybookManagementModify.do">
	<div id="myStylebookManagementModifyModal" class="stylebookManagementModifyModal">
		<div class="stylebookManagementModifyModal-content">
			<span class="closeStylebookManagementModal">&times;</span>
			<font size="5pt" style="color: #363636; font-weight: bold;">스타일 찾기 수정</font><br>
		<hr	align="left" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 185px;
	    	  border-top: 2px solid #5A5A5A;"><br><br>
	    <div class="input-container" style="color: black;">
	    	<select name="service" class="stylebookManagementService">
	    		<option value="">서비스 선택</option>
	    		<option value="커트">커트</option>
	    		<option value="펌">펌</option>
	    		<option value="스타일">스타일</option>
	    		<option value="염색">염색</option>
	    	</select>
	    </div>
		<div class="input-container">
			<span style="font-weight: bold; margin-right: 50px; color:black;">스타일 이름</span>
			<input type="text" name="discription" class="stylebookManagementDiscription" style="margin-top: 10px; color: black;" size="34" placeholder="상세 스타일 이름 입력">
			<div class="stylebookManagementDiscriptionDiv" align="center"></div>
		</div><br><br>
		<div class="input-container">
			<span style="font-weight: bold; margin-right: 50px; color:black; clear:both;">이미지</span>
			<input type="file" name="image" class="stylebookManagementImage" style="margin-top: 10px; color: black;" size="30" placeholder="헤어 이미지 등록">
			<div class="stylebookManagementImageDiv" align="center"></div>
		</div>
		<hr	align="left" style="color: black;
			  margin-top: 10px;
	    	  margin-bottom: 0px;
	    	  width: 535px;
	    	  border-top: 1px solid #5A5A5A;">
		<div class="button-container" align="center">
			<input type="button" class="stylebookManagementModifyBtn" style="width: 80px; margin-right: 10px; color:black;" value="변경">
			<input type="reset" style="width: 80px; color:black;" value="다시 작성">
			</div>
		</div>
	</div>
	<input type="hidden" name="hairShopId" class="stylebookManagement-hairShopId" value="${hairShopId }">
	<input type="hidden" name="seq" class="hiddenStylebookSeq"/>
</form>
<script>
$(document).ready(function(){
	$.ajax({
		type : 'POST',
		url : '../companyPage/getStylebookImage.do',
		data : {'hairShopId':$('.stylebookManagement-hairShopId').val()},
		dataType : 'json',
		success : function(data){
			$.each(data.list, function(index, items){
				var seq = items.SEQ;
				$('<div/>',{
					class : 'stylebookManagement-section'
				}).append($('<div/>',{
					class : 'stylebookManagement-image'
					}).append($('<img/>',{
						src : '/hairShopProject/storage/'+items.PERMIMAGE
					}))
				).append($('<div/>',{
					class : 'stylebookManagement-subject'
					}).append($('<span/>',{
						text : items.DISCRIPTION
					}))
				).append($('<div/>',{
					class : 'stylebookManagement-hairShopName'
					}).append($('<span/>',{
						text : items.NAME
					}))
				).append($('<div/>',{
					class : 'stylebookManagement-btn'
					}).append($('<input/>',{
						type : 'button',
						class : 'stylebookManagement-modifyBtn',
						value : '수정',
						onclick : 'stylebookManagementModify(\''+seq+'\')'
					})).append($('<input/>',{
						type : 'button',
						class : 'stylebookManagement-deleteBtn',
						value : '삭제',
						onclick : 'stylebookManagementDelete(\''+seq+'\')'
					}))
				).appendTo($('div.stylebookManagementFormDiv'));
			});
		}
	});
	
	$('.closeStylebookManagementModal').on('click',function(){
		$('#myStylebookManagementModifyModal').css("display","none");
		$('#myStylebookManagementInsertModal').css("display","none");
	});
	
	$('div.stylebookManagementModifyModal-content').on('click', '.stylebookManagementModifyBtn', function(){
		$('.stylebookManagementDiscriptionDiv, .stylebookManagementNameDiv, .stylebookManagementImageDiv').empty();
		if($('.stylebookManagementDiscription').val()==""){
			$('.stylebookManagementDiscriptionDiv').text('스타일 이름을 작성해주세요.').css('font-size','9pt').css('color','red').css('font-weight','bold');
		} else if($('.stylebookManagementImage').val()==""){
			$('.stylebookManagementImageDiv').text('이미지를 등록해주세요.').css('font-size','9pt').css('color','red').css('font-weight','bold');
		} else if($('.stylebookManagementService').val()==""){
			alert("서비스를 선택해주세요.");
		} else {
			document.stylebookManagementModifyForm.submit();
		}
	});
	
	$('div.stylebookManagementFormDiv').on('click','.stylebookManagement-deleteBtn', function(){
		if(confirm("삭제하시겠습니까?") == true){
			$.ajax({
				type : 'POST',
				url : '../companyPage/stylebookDelete.do',
				data : {'seq':$('.hiddenStylebookSeq').val()},
				dataType : 'text',
				success : function(data){
					if(data=="success"){
						alert("삭제 되었습니다.")
						location.href="../companyPage/stylebookManagement.do";
					} else {
						window.location.reload(true);
					}
				}
			});
		}
	});
	
	$('.insertModal').on('click', function(){
		$('#myStylebookManagementInsertModal').css("display", "block").css("background-color","rgba(0,0,0,0.1)");
	})
	
	$('.stylebookManagementInsertBtn').on('click',function(){
		$('.stylebookManagementDiscriptionDiv, .stylebookManagementNameDiv, .stylebookManagementImageDiv').empty();
		if($('.stylebookManagementInsertDiscription').val()==""){
			$('.stylebookManagementInsertDiscriptionDiv').text('스타일 이름을 작성해주세요.').css('font-size','9pt').css('color','red').css('font-weight','bold');
		} else if($('.stylebookManagementInsertImage').val()==""){
			$('.stylebookManagementInsertImageDiv').text('이미지를 등록해주세요.').css('font-size','9pt').css('color','red').css('font-weight','bold');
		} else if($('.stylebookManagementInsertService').val()==""){
			alert("서비스를 선택해주세요.");
		} else {
			document.stylebookManagementInsertForm.submit();
		}
	});
});
function stylebookManagementModify(seq){
	$('#myStylebookManagementModifyModal').css("display", "block").css("background-color","rgba(0,0,0,0.1)");
	$('.hiddenStylebookSeq').val(seq);
}
function stylebookManagementDelete(seq){
	$('.hiddenStylebookSeq').val(seq);
}
</script>