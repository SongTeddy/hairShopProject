<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="/hairShopProject/member/css/style.css">
<link rel="stylesheet" href="/hairShopProject/member/css/login.css">
<link rel="stylesheet" href="/hairShopProject/member/css/signUp.css">
<link rel="stylesheet" href="/hairShopProject/member/css/findMember.css">
<style>

/* The Modal (background) */
.modal {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 9000;
	display: none;
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 30px auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 35%; /* Could be more or less, depending on screen size */
}

</style>
<div id="myModal" class="modal">
	<div class="modal-content">
		<!-- Mixins-->
		<!-- Pen Title-->
		<div class="loginContainer">
		
			<!-- 로그인 -->
			<div class="card"></div>
			
			<div class="card">
				<h1 class="title">Login</h1>
				
				<form>
					<div class="input-container">
						<input type="text" id="loginEmail" required="required" /> <label for="${label}">Username</label>
						<div class="bar"></div>
					</div>
					
					<div class="input-container">
						<input type="text" id="loginPwd" required="required" /> <label for="${label}">Password</label>
						<div class="bar"></div>
					</div>
					
					<div id="loginBtn" class="button-container">
						<button>
							<span>Go</span>
						</button>
					</div>
				</form>
			</div>
			
			<!-- 회원가입 Div -->
			<div class="card alt">
				<div class="loginToggle"></div>
				
				<h1 class="title">
					Register
					<div class="close"></div>
					
					<div class="type">
						<input type="radio" name="type" class="type1" value="0" checked>개인&emsp;
						<input type="radio" name="type" class="type2" value="1">사업
					</div>
				</h1>
				
				<form class="signUpForm">
					<div class="input-container">
						<input type="${type}" class="email" required="required" style="width:273px;" /> <label >Email</label>
						<input class="btn btn-primary emailCheck" type="button" value="Email Check" style="width:120px; height:30px; color:white; background:#098bf7;"/>
						<div class="bar"></div>
					</div>
					
					<div class="input-container" align="center">
						<div id="emailDiv"></div>
					</div>
					
					<div class="input-container">
						<input type="${type}" class="name" required="required" /> <label >Name</label>
						<div class="bar"></div>
					</div>
					
					<div class="input-container" align="center">
						<div id="nameDiv"></div>
					</div>
					
					<div class="input-container">
						<input type="password" class="pwd" required="required" /> <label >Password</label>
						<div class="bar"></div>
					</div>
					
					<div class="input-container" align="center">
						<div id="pwdDiv"></div>
					</div>
					
					<div class="input-container" align="center">
						<input type="password" class="rePwd" required="required" /> <label >Repeat Password</label>
						<div class="bar"></div>
					</div>
					
					<div class="input-container" align="center">
						<div id="rePwdDiv"></div>
					</div>
					
					<div class="input-container">
						<%-- <input type="${type}" id="${label}" required="required" /> --%>
						<label >Cellphone</label><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<select class="tel1" style="height:25px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="010">016</option>
							<option value="010">019</option>
						</select>&emsp;
						<span style="color:white; font-weight:bold;">-</span>
						<input type="${type}" class="tel2" style="width:92px; height:27px; color:white; text-align:center; font-size:15pt;" required="required"/><span style="color:white; font-weight:bold;">-</span>
						<input type="${type}" class="tel3" style="width:92px; height:27px; color:white; text-align:center; font-size:15pt;" required="required"/><br><br>
						<div class="bar"></div>
					</div>
					
					<div class="input-container" align="center">
						<div id="telDiv"></div>
					</div>
					
					<div class="button-container" id="writeBtn">
						<button type="button">
							<span>Next</span>
						</button>
					</div>
				</form>
			</div> <!-- card alt -->
			
			
			<!-- 아이디/비밀번호 찾기 Div -->
			<div class="findMemberDiv">
				<div class="findMemberToggle"></div>
				
				<h1 class="findMemberTitle">
					<div id="findTitle"></div>
					
					<div class="close"></div><br><br>
					
					<div class="findIdPwdDiv" style="font-size:12pt">
						<input type="radio" name="find" class="findId" value="0" checked>아이디찾기&emsp;
						<input type="radio" name="find" class="findPwd" value="1">비밀번호찾기
					</div>
				</h1>

				<form class="findIdForm">
					<div class="input-container">
						<!-- <input type="text" id="findCellphone" required autocomplete="off" /> -->
						<label for="findCellphone" class="find" style="font-size:17pt;">Cellphone</label><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
						<select class="checkTel1" style="height:25px;">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="010">016</option>
							<option value="010">019</option>
						</select>&emsp;
						<span style="color:white; font-weight:bold;">-</span>
						<input type="${type}" class="checkTel2" style="width:92px; height:27px; color:white; text-align:center; font-size:15pt;" required="required"/><span style="color:white; font-weight:bold;">-</span>
						<input type="${type}" class="checkTel3" style="width:92px; height:27px; color:white; text-align:center; font-size:15pt;" required="required"/><br>
						
						<div class="bar"></div>
					</div>
					
					<div class="idValid-container" align="center">
						<div class="findIdDivValid" style="height: 9px;"></div>
					</div>
					
					<div class="button-container" id="findIdBtn" align="center">
						<button type="button">
							<span>NEXT</span>
						</button>
					</div>
				</form>
				
				<!-- 비밀번호 찾기 -->
				<form class="findPwdForm">
					<div class="input-container">
						<input type="${type}" id="findEmail" required autocomplete="off" />
						<label for="${label}">Email</label>
						
						<div class="bar"></div>
					</div>
					
					<div class="pwdValid-container" align="center">
						<div class="findPwdDivValid" style="height: 9px;"></div>
					</div>
					
					<div class="button-container" id="findMemberBtn" align="center">
						<button type="button">
							<span>NEXT</span>
						</button>
					</div>
				</form>
			</div> <!-- findMember -->
		</div> <!-- loginContainer -->
		
		<div id="loginCancelBtn" class="rerun">
			<a><i class="fa fa-reply" aria-hidden="true"></i></a>
		</div>
		
		<!-- Portfolio-->
		<a id="portfolio" href="http://andytran.me/" title="View my portfolio!"><i class="fa fa-link"></i></a>
		<!-- CodePen-->
		<a id="codepen" href="https://codepen.io/andytran/" title="Follow me!"><i class="fa fa-codepen"></i></a>
	</div>

</div>
<script	src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/hairShopProject/member/js/index.js"></script>
<script src="/hairShopProject/member/js/login.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#licenseDiv').hide();
	$('#hairShopDiv').hide();
	$('#componyAddr1Div').hide();
	$('#componyAddr2Div').hide();
	$('.findPwdForm').hide();
	
	if($('input:radio[name=find]:checked').val()==0){
		$('#findTitle').text('아이디 찾기');
	}
	
	$('#writeBtn').on('click',function(){
		$('#emailDiv, #nameDiv, #pwdDiv, #rePwdDiv, #telDiv').empty();
		
		if($('input[name=type]:checked').val()==0){
			if($('.email').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '이메일을 입력해 주세요.'
				}).appendTo($('#emailDiv'));
			} else if($('.name').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '이름을 입력해 주세요.'
				}).appendTo($('#nameDiv'));
			} else if($('.pwd').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '비밀번호를 입력해 주세요.'
				}).appendTo($('#pwdDiv'));
			} else if($('.rePwd').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '비밀번호를 재입력해 주세요.'
				}).appendTo($('#rePwdDiv'));
			} else if($('.tel2').val()=="" || $('.tel3').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '나머지번호를 입력해 주세요.'
				}).appendTo($('#telDiv'));
			}else {
				$.ajax({
					type : 'POST',
					url : '../member/write.do',
					data :  {'email':$('.email').val(), 'name':$('.name').val(), 'pwd':$('.pwd').val(), 'type':$('input[name=type]:checked').val(), 'gender':$('input:radio[name=gender]:checked').val(), 'tel1':$('.tel1').val(), 'tel2':$('.tel2').val(), 'tel3':$('.tel3').val(), 'zipcode':$('.zipcode').val(), 'addr1':$('.addr1').val(), 'addr2':$('.addr2').val()},
					dataType : 'text',
					success : function(data){
						alert(data);
						if(data=="success"){
							alert("회원가입 완료!!\n\n작성하신 이메일로 인증 메일을 발송했습니다.\n인증을 하셔야 로그인이 가능합니다.");
							location.href="../main/index.do"
						}
					}
				});
			}
		}//일반 유저 회원가입
		else if($('input[name=type]:checked').val()==1){
			if($('.email').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '이메일을 입력해 주세요.'
				}).appendTo($('#emailDiv'));
			} else if($('.name').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '이름을 입력해 주세요.'
				}).appendTo($('#nameDiv'));
			} else if($('.pwd').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '비밀번호를 입력해 주세요.'
				}).appendTo($('#pwdDiv'));
			} else if($('.rePwd').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '비밀번호를 재입력해 주세요.'
				}).appendTo($('#rePwdDiv'));
			} else if($('.tel2').val()=="" || $('.tel3').val()=="") {
				$('<span/>',{
					style : 'color:white; font-weight:bold; font-size:9pt;',
					text : '나머지번호를 입력해 주세요.'
				}).appendTo($('#telDiv'));
			}else {
				$.ajax({
					type : 'POST',
					url : '../member/write.do',
					data :  {'email':$('.email').val(), 'name':$('.name').val(), 'pwd':$('.pwd').val(), 'type':$('input[name=type]:checked').val(), 'gender':$('input:radio[name=gender]:checked').val(), 'tel1':$('.tel1').val(), 'tel2':$('.tel2').val(), 'tel3':$('.tel3').val(), 'zipcode':$('.zipcode').val(), 'addr1':$('.addr1').val(), 'addr2':$('.addr2').val(), 'license1':$('.license1').val(), 'license2':$('.license2').val(), 'license3':$('.license3').val(), 'componyzipcode':$('.componyzipcode').val(), 'componyaddr1':$('.componyaddr1').val(), 'componyaddr2':$('.componyaddr2').val()},
					dataType : 'text',
					success : function(data){
						alert(data)
						if(data=="success"){
							alert("회원가입 완료!!\n\n작성하신 이메일로 인증 메일을 발송했습니다.\n인증을 하셔야 로그인이 가능합니다.");
							location.href="../main/index.do"
						}
					}
				});
			} 
		}//사업자 유저 회원가입
	});
	
	$('.type2').on('click',function(){ // 사업자
		$('.hiddenType').val($('.type2').val());
		$('.signUpForm')[0].reset();
	});
	$('.type1').on('click',function(){ // 개인
		$('.hiddenType').val($('.type1').val())
		$('.signUpForm')[0].reset();
	});
	
	$('.emailCheck').on('click',function(){
		$('#emailDiv').empty();
		
		$.ajax({
			type : 'POST',
			url : '../member/checkEmail.do',
			data : {'email':$('.email').val()},
			dataType : 'text',
			success : function(data){
				if(data=="empty") {
					$('<span/>',{
						style : 'color:white; font-weight:bold; font-size:9pt;',
						text : '이메일을 입력하세요.'
					}).appendTo($('#emailDiv'));
				} else if(data=="exist"){
					$('<span/>',{
						style : 'color:white; font-weight:bold; font-size:9pt;',
						text : '사용 불가능한 이메일 입니다.'
					}).appendTo($('#emailDiv'));
				} else if(data=="non_exist"){
					$('<span/>',{
						style : 'color:white; font-weight:bold; font-size:9pt;',
						text : '사용 가능한 이메일 입니다.'
					}).appendTo($('#emailDiv'));
				}
			}
		});
	});
	
	$('#findIdBtn').on('click', function(){
		$('.findIdDivValid').empty();
		
		if($('.checkTel2').val()=="" || $('.checkTel3').val()==""){
			$('<span/>',{
				style : 'font-weight:bold; font-size:12pt; color:white;',
				text : '번호를 전부 입력해주세요.'
			}).appendTo($('.findIdDivValid'));
			
		} else {
			$.ajax({
				type : 'POST',
				url : '../member/findId.do',
				data : {'tel1':$('.checkTel1').val(), 'tel2':$('.checkTel2').val(), 'tel3':$('.checkTel3').val()},
				dataType : 'text',
				success : function(data){
					if(data==""){
						alert("가입된 아이디가 없습니다.");
					} else {
						$('<span/>',{
							style : 'font-size:12pt; font-weight:bold; color:white;',
							text : '찾으시는 이메일은 '+data+' 입니다.'
						}).appendTo($('.findIdDivValid'));
					}
				}
			});
		}
	});
	
	/* 아이디, 비밀번호 찾기 */
	$('#findMemberBtn').on('click', function(){
		$('.findPwdDivValid').empty();
		
		if($('#findEmail').val()==""){
			$('<span/>',{
				style : 'font-weight:bold; font-size:12pt; color:white;',
				text : '이메일을 입력해주세요.'
			}).appendTo($('.findPwdDivValid'));
			
		} else {
			$.ajax({
				type : 'POST',
				url : '/hairShopProject/member/findMember.do',
				data : {'email':$('#findEmail').val()},
				dataType : 'text',
				success : function(data){
					if(data=="fail"){
						$('<span/>',{
							style : 'font-size:12pt; font-weight:bold; color:white;',
							text : '작성하신 이메일은 가입되어있지 않습니다.'
						}).appendTo($('.findPwdDivValid'));
						
					} else if(data=="invalid_email"){
						$('<span/>',{
							style : 'font-size:12pt; font-weight:bold; color:white;',
							text : '인증되지 않은 이메일입니다.'
						}).appendTo($('.findPwdDivValid'));
						
					} else if(data=="success"){
						alert("가입하신 이메일로 임시 비밀번호를 전송하였습니다.");
						location.href="../main/index.do";
					}
				}
			});
		}
	});
	$('.findId').on('click', function(){
		$('.findPwdForm').hide();
		$('.findIdForm').show();
		$('#findTitle').text("아이디 찾기");
		$('.findPwdDivValid').text('');
	});
	$('.findPwd').on('click', function(){
		$('.findIdForm').hide();
		$('.findPwdForm').show();
		$('#findTitle').text("비밀번호 찾기");
		$('.findIdDivValid').text('');
	});
	
	/* 유효성 검사 리셋 */
	$('.close, .type1, .type2, .loginToggle, .findMemberToggle').on('click', function() {
		$('.findPwdDivValid, .findIdDivValid').text('');
		$('#emailDiv, #nameDiv, #pwdDiv, #rePwdDiv, #telDiv').text("");
	});
	
	/* 모달 종료 버튼 */
	$('#loginCancelBtn').on('click', function() {
		$('#myModal').fadeOut(300);
	});
});	
</script>
