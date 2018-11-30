$(document).ready(function(){
	$('.deleteBtn').on('click',function(){
		if(confirm("정말 회원을 탈퇴하겠습니까?") == true){
			$.ajax({
				type : 'POST',
				url : '../managementPage/delete.do',
				data : {'email':$('.deleteEmail').val(), 'pwd':$('.deletePwd').val()},
				dataType : 'text',
				success : function(data){
					if(data=="success")
						alert("정상적으로 회원 탈퇴 되었습니다.")
						location.href="../main/index.do";
				}
			});
		} else {
			history.go(0);
		}
	});
	
	$('table.reservationTable').on('click','input.reservationCheck',function(){
		if(confirm("예약을 취소하겠습니까?")==true){
			$.ajax({
				type : 'POST',
				url : '../managementPage/reservationCancel.do',
				data : {'email':$('.reservationEmail').val()},
				dataType : 'text',
				success : function(data){
					if(data=="success") {
						alert("예약이 취소되었습니다.")
						document.reservationForm.method="post";
						document.reservationForm.action="managementPage.do";
						document.reservationForm.submit();
					}
				}
			});
		} else {
			history.go(0);
		}
	});
	
	$('.checkPostBtn').on('click',function(){		
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				   
				    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				    extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
				   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraRoadAddr !== ''){
				extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if(fullRoadAddr !== ''){
				    fullRoadAddr += extraRoadAddr;
				}
				
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('addr1').value = fullRoadAddr;
				document.getElementById('addr2').focus();
			}
		}).open();
	});
});