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
					location.href="/hairShopProject/managementPage/memberPage.do";
				}else if(data=="1") {
					location.href="/hairShopProject/managementPage/companyPage.do";
				}else if(data=="2") {
					location.href="/hairShopProject/managementPage/adminPage.do";
				}
			}
		});
	});
});