$(document).ready(function(){
	// 로그인
	$('#loginBtn').on('click', function() {
		$('#loginEmailDiv').empty();
		$('#loginPwdDiv').empty();
		
		var loginEmail = $('#loginEmail').val();
		var loginPwd = $('#loginPwd').val();
		
		if($('#loginEmail').val()=="")	$('#loginEmailDiv').text('이메일을 입력해 주세요.').css('color','red').css('font-weight','bold').css('font-size','9pt')
		
		else if($('#loginPwd').val()=="") $('#loginPwdDiv').text('비밀번호를 입력해 주세요.').css('color','red').css('font-weight','bold').css('font-size','9pt')
		
		else {
			try { 
				var rsaPublicKeyModulus = $("#hiddenModulus").val();
				var rsaPublicKeyExponent = $("#hiddenExponent").val();
				makePrivateKey(loginEmail, loginPwd, rsaPublicKeyModulus, rsaPublicKeyExponent); 
			} catch(err) { 
					alert(err); 
			}
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
function makePrivateKey(loginEmail, loginPwd, rsaPublicKeyModulus, rsaPublicKeyExponent) {
	var rsa = new RSAKey(); 

	rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent); 
	
	// 사용자 ID와 비밀번호를 RSA로 암호화한다. 
	var securedUsername = rsa.encrypt(loginEmail); 
	var securedPassword = rsa.encrypt(loginPwd); 
	
	// POST 로그인 폼에 값을 설정하고 발행(submit)한다. 
	document.loginForm.securedUsername.value = securedUsername; 
	document.loginForm.securedPassword.value = securedPassword;
	if(loginEmail!=""&&loginPwd!="") {
		$.ajax({
			type : 'POST',
			url : '/hairShopProject/member/memberLogin.do',
			data : {'loginEmail':loginEmail, 'loginPwd':loginPwd, 'publicKeyModulus':rsaPublicKeyModulus, 'publicKeyExponent':rsaPublicKeyExponent, 'securedUsername':securedUsername, 'securedPassword':securedPassword},
			dataType : 'text',
			success : function(data) {
				if(data=='exist') {
					location.href="/hairShopProject/main/index.do"
				}else if(data=='non_exist') 
					alert("아이디/비밀번호가 틀렸거나 이메일 인증을 하지 않았습니다.\n확인해주세요.");
			}
		});
	}
}


