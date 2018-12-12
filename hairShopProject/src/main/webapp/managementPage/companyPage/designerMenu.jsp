<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/companyPage/css/designerMenu.css">
<style>
.designerTable{
	text-align: center;
}

.dayOptionDiv {
	height: 50px !important;
	color : white !important; 
	align-items : baseline !important;
	vertical-align : middle !important;
	padding-top : 23px !important;
	padding-left : 110px !important;
	position : relative !important;
	z-index : 1 !important;
	visibility: hidden;
	transition : .3s ease !important;
}
.imgUploadDiv{
	color : white !important; 
	align-items : baseline !important;
	vertical-align : middle !important;
	padding-left : 80px !important;
	position : relative !important;
	z-index : 1 !important;
	transition : .3s ease !important;
	font-size: medium;
}
</style>

<div class="designerMenu">
	<font size="6pt" style="color: #363636;">디자이너 관리</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 205px;
		    	  border-top: 2px solid #5A5A5A;"><br>
	<table id="designerTable" class="table">
		<tr bgcolor="#484848" style="padding: 5px;">
			<td width="50px">
				<input type="checkbox" name="selectAll" id="selectAll" value="선택" />
			</td>
			
			<td width="200px" style="color: white;">
				이미지
			</td>
			
			<td width="100px" style="color: white;">
				이름
			</td>
			
			<td width="100px" style="color: white;">
				포지션
			</td>
			
			<td width="150px" style="color: white;">
				출근일
			</td>
			
			<td width="50px" style="color: white;">
				
			</td>
		</tr>
	
	</table>
	<div align="right" style="width: 90%;">
	<input type="button" name="checkAllDelete" id="checkAllDelete" class="btn btn-default" value="선택삭제" />	    	  
	</div>
	<div class="designerAddDiv">
		<div class="designerAddToggle" align="left" ></div>
		
		<h1 class="designerAddTitle">
			<div id="designerTitle"><span id="thisIsTitle">디자이너 등록</span></div>
			
			<div class="close"></div>
		</h1>
		
		<form name="designerAddForm" method="post" enctype="Multipart/form-data" action="/hairShopProject/companyPage/designerAdd.do">
			<div class="input-container">
				<input type="text" name="designername" id="designername" required autocomplete="off" />
				<label for="nameL">이름</label>
				
				<div class="bar"></div>
			</div>
			
			<div class="input-container" style="align-items : baseline; vertical-align : middle !important;">
				<div class="" style="padding-left : 90px; padding-top: 20px;">
					<select name="positioncode" id="positioncode" style="color: black;">
						<option value="undefined">포지션 선택</option>
						<option value="1">원장</option>
						<option value="1">점장</option>
						<option value="2">부원장</option>
						<option value="3">실장</option>
						<option value="3">팀장</option>
						<option value="3">수석</option>
						<option value="4">디자이너</option>
						<option value="4">스타일리스트</option>
					</select>
				</div>
				<label for="nameL">포지션</label>
				
				<div class="bar">			
				</div>
			</div>
			
			
			<div class="input-container" style="align-items : baseline; vertical-align : middle !important;" >
			<div class="imgUploadDiv" style="padding-left : 100px; padding-top: 20px;">
			<input type="file" name="designerimageOriginal" class="fileUpload">
			</div>
				<label for="nameL">사진</label>
				<div class="bar"></div>
			</div>
			
			<div class="input-container">
				<label for="nameL">출근일</label>
				<div class="bar"></div>
				<div>
				</div>
				
			</div>
			<div class="dayOptionDiv">
			월 <input type="checkbox" name="day" class="dayOption" id="2" value="2" checked="checked" />
			&ensp;화 <input type="checkbox" name="day" class="dayOption" id="3" value="3" checked="checked" />
			&ensp;수 <input type="checkbox" name="day" class="dayOption" id="4" value="4" checked="checked" />
			&ensp;목 <input type="checkbox" name="day" class="dayOption" id="5" value="5" checked="checked" />
			&ensp;금 <input type="checkbox" name="day" class="dayOption" id="6" value="6" checked="checked" />
			&ensp;<span style="color: blue;">토</span> <input type="checkbox" name="day" class="dayOption" id="7" value="7" checked="checked" />
			&ensp;<span style="color: red;">일</span> <input type="checkbox" name="day" class="dayOption" id="1" value="1" checked="checked" />
			</div>
			<div class="input-container"></div>
			<div class="button-container" id="designerAddOrModify" align="center">
				<button type="button" style="border-radius: 10px;">
					<span id="doIt">등&emsp;&emsp;록</span>
				</button>
			</div>
			<input type="hidden" name="hairshopid" id="hairShopId" value="${hairShopId }">
			<input type="hidden" name="dayoff" />
			<input type="hidden" name="position" />
			<input type="hidden" name="insertOrUpdate" />
			<input type="hidden" name="previousDesignerId" />
		</form>
	</div> <!-- findMember -->
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/companyPage/js/designerMenu.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/companyPage/getDesignerInfo.do',
		data: {'hairshopId':$('#hairShopId').val()},
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items) {
				$('<tr/>', {
					style : 'color: #515151;'
					
				}).append($('<td/>', {
					height : '50px',
					style : 'text-align : center!important; padding-left:5px;'
					
				}).append($('<input/>', {
					type : 'checkbox',
					value : items.designerid,
					class : 'selectOne'
						
				}))).append($('<td/>').append($('<img/>', {
					src : '/hairShopProject/hairShop/img/team/' + items.designerimage,
					width : '50'
				}))).append($('<td/>',{
						text : items.designername,
					class : 'designername'
					
				})).append($('<td/>', {
					text : items.position,
				})).append($('<td/>',{
					text : (items.dayoff)
								.replace('1', '일 ')
								.replace('2', '월 ')
								.replace('3', '화 ')
								.replace('4', '수 ')
								.replace('5', '목 ')
								.replace('6', '금 ')
								.replace('7', '토 '),
					class : 'dayoff',
					readonly : 'readonly'
					
				}).append($('<input/>', {
					type : 'hidden',
					value : items.dayoff
					
				}))).append($('<td/>', {
					}).append($('<input/>', {
						type : 'button',
						value : '수정',
						class : 'btn btn-default btn-xs designerModifyBtn'
				}))).appendTo($('#designerTable'));
			});
		}
	});
	$('select#positioncode').on('change', function(){
		$('input[name=position]').val($('select#positioncode option:selected').text());
	});
	
	/* 추가 또는 수정 */
	$('#designerAddOrModify').on('click', function() {
		if($('input[name=insertOrUpdate]').val()=='insert'){			
			var dayoff = "";
			for(var i=1; i<8; i++){
				if($('#'+i).is(':checked'))
					dayoff = dayoff + $('#'+i).val();
			}
			$('input[name=dayoff]').val(dayoff);
			if($('input[name=designername]').val()=="")
				alert("이름을 입력하세요.");
			else if($('select#positioncode').val()=="undefined")
				alert("포지션을 선택하세요");
			else if($("input:checkbox[name=day]:checked").length==0)
				alert("근무 요일을 선택하세요.");
			else{
				$('form[name=designerAddForm]').submit();			
			}
		}else if($('input[name=insertOrUpdate]').val()=='update'){
			var dayoff = "";
			for(var i=1; i<8; i++){
				if($('#'+i).is(':checked'))
					dayoff = dayoff + $('#'+i).val();
			}
			$('input[name=dayoff]').val(dayoff);
			if($('input[name=designername]').val()==""){
				alert("수정할 이름을 입력하세요.");			
			}else if($('select#positioncode').val()==""){
				alert("수정할 포지션을 선택하세요");			
			}else if($("input:checkbox[name=day]:checked").length==0){
				alert("수정할 근무 요일을 선택하세요.");			
			}else{
				$('form[name=designerAddForm]').submit();
			}
		}
	});
	
	$('#designerTable').on('click', '.designerModifyBtn', function(){
		$('.dayOptionDiv').css('visibility', 'visible');
		$('.positioncode').css('visibility', 'visible');
		$('.fileUpload').css('visibility', 'visible');
		$('#thisIsTitle').text("디자이너 수정");
		$('#designername').val($(this).parent().prev().prev().prev().text());
		if($(this).parent().prev().prev().text()!=""){
			$('select#positioncode option:contains(' + $(this).parent().prev().prev().text() + ')').prop("selected", "selected");
			$('input[name=position]').val($('select#positioncode :selected').text());
		}
//         var ppp = $(this).parent().prev().prev().text();
//         alert(ppp);
//         alert($('#positioncode').find('option[text="' + ppp + '"]').val());
		
		$('input[name=previousDesignerId]').val($(this).parent().parent().children(':first').children(':first').val());
        var targetDayoff = $(this).parent().prev().children(':last').val();
        for(var i=1; i<=7; i++){
       		$('#' + i).attr("checked", false);
       	}
       	for(var i=0; i<targetDayoff.length; i++){
       		$('#' + targetDayoff[i]).attr("checked", true);
       	}
       	$('#doIt').html("수&emsp;&emsp;정");
		$('input[name=insertOrUpdate]').val("update");
        $('.designerMenu').stop().addClass('designerAdd');
	});
});
</script>