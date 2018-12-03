<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/memberManagement.css">

<font size="6pt" style="color: #363636;">회원 관리</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 140px;
		    	  border-top: 2px solid #5A5A5A;"><br>
		    	  
<div class="memberManagement">
	<div class="memberTotal">회원 Total : </div><br>
	
	<table id="memberListTable" frame="hsides" rules="rows" align="center" style="clear: both;">
	
		<tr bgcolor="#484848" style="padding: 5px; border-top: 2px solid #909090; border-bottom: 2px solid #909090; font-weight: bold;">						
			<td width="150px" style="color: white;">
				이메일
			</td>
			
			<td width="150px" style="color: white;">
				비밀번호
			</td>
			
			<td width="150px" style="color: white;">
				이름
			</td>
			
			<td width="150px" style="color: white;">
				연락처
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
<script src="/hairShopProject/managementPage/adminPage/js/memberManagement.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getMemberList.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			$.each(data.memberList, function(index, items) {
				$('<tr/>', {
					style : 'color: #515151;'
					
				}).append($('<td/>', {
					height : '50px',
					style : 'font-size: 15px; text-align: center; border: none;',
					text : items.email,
					id : items.seq,
					class : 'memberEmail' 
						
				})).append($('<td/>').append($('<input/>', {
						type : 'text',
						style : 'font-size: 15px; text-align: center; border: none;',
						value : items.pwd,
						id : items.seq,
						class : 'memberPwd',
						readonly : 'readonly'
						
				}))).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.name,
					id : items.seq,
					class : 'memberName',
					readonly : 'readonly'
					
				}))).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.tel1+'-'+items.tel2+'-'+items.tel3,
					id : items.seq,
					class : 'memberTel',
					readonly : 'readonly'
					
				}))).append($('<td/>').append($('<input/>', {
					type : 'text',
					style : 'font-size: 15px; text-align: center; border: none;',
					value : items.logtime,
					id : items.seq,
					class : 'memberLogtime',
					readonly : 'readonly'
					
				}))).append($('<td/>', {
					
					}).append($('<input/>', {
						type : 'button',
						value : '수정',
						id : 'memberModifyBtn',
						class : items.seq
						
					})).append('<br>').append($('<input/>', {
					type : 'button',
					value : '삭제',
					class : 'memberDeleteBtn'
					
				}))).appendTo($('#memberListTable'));
			});
		}
	});
});
</script>