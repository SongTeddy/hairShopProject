<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/companyPage/css/designerMenu.css">

<input type="hidden" id="hairshopId" value="${hairshopId }">
    
<div class="designerMenu">
	<font size="6pt" style="color: #363636;">디자이너 관리</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 205px;
		    	  border-top: 2px solid #5A5A5A;"><br>
	
	<table id="designerTable"  frame="hsides" rules="rows" align="center">
	
		<tr bgcolor="#484848" class="designerListTr" style="padding: 5px; border-top: 2px solid #909090; border-bottom: 2px solid #909090; font-weight: bold;">
			<td width="100px">
				<input type="checkbox" name="checkAll" id="checkAll" value="선택" />
				<input type="button" name="checkAllDelete" id="checkAllDelete" value="선택삭제" />
			</td>
			
			<td width="100px" style="color: white;">
				이미지
			</td>
			
			<td width="150px" style="color: white;">
				이름
			</td>
			
			<td width="200px" style="color: white;">
				아이디
			</td>
			
			<td width="150px" style="color: white;">
				포지션
			</td>
			
			<td width="150px" style="color: white;">
				출근일
			</td>
			
			<td width="90px" style="color: white;">
				수정 / 삭제
			</td>
		</tr>
	
	</table>
	
	<div class="designerAddDiv">
		<div class="designerAddToggle" align="left"></div>
		
		<h1 class="designerAddTitle">
			<div id="designerTitle">디자이너 등록</div>
			
			<div class="close"></div>
		</h1>
		
		<form class="designerAddForm">
			<div class="input-container">
				<input type="text" class="addDesignername" required autocomplete="off" />
				<label for="nameL">이름</label>
				
				<div class="bar"></div>
			</div>
			
			<div class="input-container">
				<input type="text" class="addPosition" required autocomplete="off" />
				<label for="nameL">포지션</label>
				
				<div class="bar"></div>
			</div>
			
			<div class="input-container">
				<input type="text" class="addDayoff" required autocomplete="off" />
				<label for="nameL">출근일</label>
				
				<div class="bar"></div>
			</div>
			
			<div class="button-container" id="designerAdd" align="center">
				<button type="button">
					<span>ADD</span>
				</button>
			</div>
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
		data: {'hairshopId':$('#hairshopId').val()},
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items) {
				$('<tr/>', {
					style : 'color: #515151;'
					
				}).append($('<td/>', {
					height : '50px'
					
					}).append($('<input/>', {
						type : 'hidden',
						id : 'seq',
						value : items.seq
						
					})).append($('<input/>', {
						type : 'checkbox',
						id : 'checkbox',
						class : 'checkbox',
						value : items.seq
						
				}))).append($('<td/>').append($('<input/>', {
						type : 'text',
						style : 'font-size: 15px; text-align: center; border: none;',
						value : items.designerimage,
						id : items.seq,
						class : 'designerimage',
						readonly : 'readonly'
						
				}))).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.designername,
					id : items.seq,
					class : 'designername',
					readonly : 'readonly'
					
				}))).append($('<td/>', {
					text : items.hairshopid+'_'+items.designername,
					style : 'font-size: 15px; text-align: center; border: none;',
					id : items.seq,
					class : 'designerid'
					
				})).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.position,
					id : items.seq,
					class : 'position',
					readonly : 'readonly'
					
				}))).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : (items.dayoff)
								.replace('1', '월 ')
								.replace('2', '화 ')
								.replace('3', '수 ')
								.replace('4', '목 ')
								.replace('5', '금 ')
								.replace('6', '토 ')
								.replace('7', '일 '),
					id : items.seq,
					class : 'dayoff',
					readonly : 'readonly'
					
				}))).append($('<td/>', {
					
					}).append($('<div/>', {
						style: 'float: left; height: 50%; width: 100%;'
						
						}).append($('<button/>', {
							type : 'button',
							text : '수정',
							id : 'designerModify',
							class : items.seq,
							style : 'border-bottom: 1px solid #484848; width: 100%; height: 100%;'
						
					}))).append($('<div/>', {
						style: 'clear: both; height: 50%;'
						
						}).append($('<button/>', {
							type : 'button',
							text : '삭제',
							class : 'designerDelete',
							style : 'width: 100%; height: 100%;'
							
				})))).appendTo($('#designerTable'));
			});
		}
	});
});
</script>