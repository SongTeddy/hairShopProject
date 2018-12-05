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
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/adminPage/js/hairShopManagement.js"></script>
<script>
var hairShopNameAr = new Array(); // 헤어샵 이름 배열

$(document).ready(function() {
	
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
			for(var i=0; i<hairShopNameAr.length; i++) {
				$('<table/>', {
					id : hairShopNameAr[i],
					align : 'center'
					
					}).append($('<tr/>').append($('<td/>', {
						style : 'color: white;'+
								'font-weight: bold;'+
								'border: 2px solid #EDEDED;'
							
						}).append($('<button/>', {
							text : hairShopNameAr[i],
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
					success : function(data2) {
						alert(JSON.stringify(data2));
					}
				});
			} // for문
		} // success
	}); // ajax
});
</script>