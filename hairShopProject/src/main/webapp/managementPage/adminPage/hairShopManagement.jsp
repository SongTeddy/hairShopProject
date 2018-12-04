<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/hairShopManagement.css">

<font size="6pt" style="color: #363636;">헤어샵 관리</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 170px;
		    	  border-top: 2px solid #5A5A5A;"><br>
		    	  
<div class="hairShopManagement">
	<div class="hairShopTotal">헤어샵 Total : </div><br>
	
	<table id="hairShopListTable"  frame="hsides" rules="rows" align="center">
	
		<tr bgcolor="#484848" style="padding: 5px; border-top: 2px solid #909090; border-bottom: 2px solid #909090; font-weight: bold;">			
			<td width="150px" style="color: white;">
				아이디
			</td>
			
			<td width="150px" style="color: white;">
				이메일
			</td>
			
			<td width="150px" style="color: white;">
				연락처
			</td>
			
			<td width="150px" style="color: white;">
				영업일
			</td>
			
			<td width="150px" style="color: white;">
				영업시간
			</td>
			
			<td width="150px" style="color: white;">
				가입일
			</td>
			
			<td width="150px" style="color: white;">
				관리
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/adminPage/js/hairShopManagement.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getHairShopList.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			$.each(data.hairShopList, function(index, items) {
				$('<tr/>', {
					style : 'color: #515151;'
					
				}).append($('<td/>', {
					height : '50px',
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.hairshopid,
					id : items.seq,
					class : 'designerimage',
					readonly : 'readonly'  
						
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
					
				}))).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.designerid,
					id : items.seq,
					class : 'designerid',
					readonly : 'readonly'
					
				}))).append($('<td/>').append($('<input/>', {
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
					
					}).append($('<input/>', {
						type : 'button',
						value : '수정',
						id : 'designerModify',
						class : items.seq
						
					})).append('<br>').append($('<input/>', {
					type : 'button',
					value : '삭제',
					class : 'designerDelete'
					
				}))).appendTo($('#designerTable'));
			});
		}
	});
});
</script>