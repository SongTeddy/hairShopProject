<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/hairShopManagement.css">

<font size="6pt" style="color: #363636;">헤어샵 관리</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 160px;
		    	  border-top: 2px solid #5A5A5A;"><br>

<form class="hairShopListForm">
<div class="hairShopManagement">
	<div class="hairShopTotal">헤어샵 Total : </div><br>
	
</div>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/adminPage/js/hairShopManagement.js"></script>
<script>
var hairShopNameAr = new Array(); // 헤어샵 이름 배열

$(document).ready(function() {
	
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getTotalHairShop.do',
		dataType : 'text',
		success : function(data) {
			$('.hairShopTotal').append(data)
		}
	});
	
	// 헤어샵 이름과 그 이름으로 헤어샵 리스트 조회 - 각 헤어샵만의 table 생성
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getHairShopName.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			// 헤어샵 이름 배열 초기화
			$.each(data.hairShopNameList, function(index, items) {
				hairShopNameAr[index] = items;
			});
			
			// 헤어샵마다 table 하나씩 생성
			var cnt = 0; // 헤어샵을 세번씩 선택하기 위한 cnt
			for(var i=0; i<hairShopNameAr.length; i++) {
				$('<table/>', {
					style : 'clear: both;',
					id : hairShopNameAr[i],
					class : 'hairShopListTable',
					align : 'center'
					
					}).append($('<tr/>').append($('<td/>', {
						style : 'color: white;'+
								'font-weight: bold;'
							
						}).append($('<button/>', {
							text : hairShopNameAr[i],
							type : 'button',
							class : 'hairShopListToggle',
							style : 'background: linear-gradient(to bottom, #7B7B7B, #575757);'+
									'height: 100%;'+
									'width: 100%;'+
									'font-size: 17px;'+
									'letter-spacing: 3px;'
					
				})))).appendTo($('.hairShopManagement'));
				
				$.ajax({
					type : 'POST',
					url : '/hairShopProject/adminPage/getHairShopList.do',
					data : {'hairShopName':hairShopNameAr[i]},
					dataType : 'json',
					async: false, // 비동기식 -> 동기식
					success : function(data) {
						//alert(JSON.stringify(data2));
						var hairShopListAr = new Array(); // 정해진 헤어샵 이름으로 된 모든 memberInfo 배열
						
						// memberInfo 배열 초기화
						$.each(data.hairShopList, function(index, items) {
							hairShopListAr[index] = items;
						});
						
						$('.hairShopManagement #'+hairShopNameAr[cnt]+' button').append('('+hairShopListAr.length+')');

						for(var j=0; j<hairShopListAr.length; j++) {
							$('#'+hairShopNameAr[cnt]).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'border: 0px; font-size: 30px; color: #484848;'
									
								}).append($('<i/>', {
										style : 'width: 40px; height: 100%; cursor: pointer;',
										class : 'fa fa-minus-circle hairShopDeleteBtn',
										id : hairShopListAr[j].email
							
							}))).after($('<div/>', {
									id : 'hairShopListDiv',
									class : hairShopNameAr[cnt],
									style : 'width: 101px; border-right: 2px solid #000000;',
									text : hairShopListAr[j].logtime
								
							})).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 138px;',
								text : hairShopListAr[j].opentime+'~'+hairShopListAr[j].closetime
									
							})).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 150px;',
								text : hairShopListAr[j].dayoff.replace('1', '월 ')
															   .replace('2', '화 ')
															   .replace('3', '수 ')
															   .replace('4', '목 ')
															   .replace('5', '금 ')
															   .replace('6', '토 ')
															   .replace('7', '일 ')
								
							})).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 70px;',
								text : hairShopListAr[j].addr1+"점"
								
							})).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 140px;',
								text : hairShopListAr[j].tel1+'-'+hairShopListAr[j].tel2+'-'+hairShopListAr[j].tel3
								
							})).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt] +' hairShopModifyBtn',
								style : 'width: 40px;'+
										'border-left: 0px;'+
										'line-height: 28px;'
									
								}).append($('<i/>', {
									style : 'width: 40px;'+
											'height: 100%;'+
											'cursor: pointer;'+
											'font-size: 18px;'+
											'background-color: #D2D2D2;'+
											'margin-bottom: 2px;'+
											'padding-top: 2px;',
									class : 'fa fa-pencil',
									id : hairShopListAr[j].email
				
							}))).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 140px; border-right: 0px; border-bottom: 2px solid #000000;'
								
								}).append($('<input/>', {
									type : 'text',
									size : '20px',
									style : 'font-size: 15px;'+
											'text-align: center;'+
											'height: 85%;'+
											'width: 100%;'+
											'border: none',
											
									value : hairShopListAr[j].pwd,
									id : hairShopListAr[j].email,
									class : 'hairShopPwd',
									readonly : 'readonly'
						
							}))).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 220px;',
								text : hairShopListAr[j].email
								
							})).after($('<div/>', {
								id : 'hairShopListDiv',
								class : hairShopNameAr[cnt],
								style : 'width: 140px; margin-left: 2px; border-left: 2px solid #000000;',
								text : hairShopListAr[j].hairshopid
								
							})).after($('<div/>', {
								style : 'clear: both; width: 0px; height: 0px;'
							}));
						}
						cnt++;
					}
				});
			} // for문
		} // success
	}); // ajax
});
</script>