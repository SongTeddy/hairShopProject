<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
<link rel="stylesheet" href="/hairShopProject/managementPage/adminPage/css/hairShopManagement.css">

<font size="6pt" style="color: #363636;">Çì¾î¼¥ °ü¸®</font><br>
	<hr align="left" style="color: black;
				  margin-top: 10px;
		    	  margin-bottom: 0px;
		    	  width: 170px;
		    	  border-top: 2px solid #5A5A5A;"><br>
		    	  
<div class="hairShopManagement">
	<div class="hairShopTotal">Çì¾î¼¥ Total : </div><br>
	
	<table id="hairShopListTable" align="center">
	</table>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="/hairShopProject/managementPage/adminPage/js/hairShopManagement.js"></script>
<script>
$(document).ready(function() {
	// Çì¾î¼¥ ÀÌ¸§ Á¶È¸
	$.ajax({
		type : 'POST',
		url : '/hairShopProject/adminPage/getHairShopName.do',
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			var hairShopNameAr = new Array();
			
			$.each(data.hairShopNameList, function(index, items) {
				hairShopNameAr[index] = items;
			});
			
			for(var i=0; i<hairShopNameAr.length; i++) {
				$('<tr/>').append($('<td/>', {
					style : 'color: white;'+
							'font-weight: bold;'+
							'border: 2px solid #EDEDED;'
							
					}).append($('<button/>', {
						text : hairShopNameAr[i],
						style : 'background: linear-gradient(to bottom, #5A5A5A, #363636);'+
								'height: 100%;'+
								'width: 100%;'+
								'font-size: 17px;'+
								'letter-spacing: 3px;'
					
				}))).appendTo($('#hairShopListTable'));
			}
		} // success
	}); // ajax
});
</script>