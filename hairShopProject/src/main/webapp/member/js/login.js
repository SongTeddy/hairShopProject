$(document).ready(function(){
	// 로그인
	$('#loginBtn').on('click', function() {
		var loginEmail = $('#loginEmail').val();
		var loginPwd = $('#loginPwd').val();
		
		if(loginEmail!=""&&loginPwd!="") {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/member/memberLogin.do',
				data : {'loginEmail':loginEmail, 'loginPwd':loginPwd},
				dataType : 'text',
				success : function(data) {
					if(data=='exist') {
						location.reload(); 
					}else if(data=='non_exist') 
						alert("아이디/비밀번호가 틀렸거나 이메일 인증을 하지 않았습니다.\n확인해주세요.");
				}
			});
		}
	});
	
	// 비밀번호 찾기
	$('.findMemberToggle').on('click', function() {
		$('.loginContainer').stop().removeClass('active');
	  	$('.loginContainer').stop().addClass('findMember');
	});
	
	// 회원가입 창
	$('.loginToggle').on('click', function() {
		$('.loginContainer').stop().removeClass('findMember');
	  	$('.loginContainer').stop().addClass('active');
	});
	
	$('.close').on('click', function() {
	  $('.loginContainer').stop().removeClass('active');
	  $('.loginContainer').stop().removeClass('findMember');
	});
});