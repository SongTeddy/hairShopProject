$(document).ready(function() {
	$('.logoutBtn').on('click', function() {
		location.href="/hairShopProject/member/memberLogout.do";
	});
	
	$('#loggedinA').on('click', function() {
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/managementPage/managementPage.do',
			data : {'memEmail':$('#memEmail').val()},
			dataType : 'text',
			success : function(data) {
				if(data=="0") {
					alert("0")
				}else {
					location.href="/hairShopProject/managementPage/companyPage.do";
				}
			}
		});
	});
});